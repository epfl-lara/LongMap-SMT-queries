; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73942 () Bool)

(assert start!73942)

(declare-fun b_free!14689 () Bool)

(declare-fun b_next!14689 () Bool)

(assert (=> start!73942 (= b_free!14689 (not b_next!14689))))

(declare-fun tp!51572 () Bool)

(declare-fun b_and!24367 () Bool)

(assert (=> start!73942 (= tp!51572 b_and!24367)))

(declare-fun b!866378 () Bool)

(declare-fun res!588420 () Bool)

(declare-fun e!482714 () Bool)

(assert (=> b!866378 (=> (not res!588420) (not e!482714))))

(declare-datatypes ((array!49861 0))(
  ( (array!49862 (arr!23957 (Array (_ BitVec 32) (_ BitVec 64))) (size!24398 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49861)

(declare-datatypes ((List!16963 0))(
  ( (Nil!16960) (Cons!16959 (h!18096 (_ BitVec 64)) (t!23910 List!16963)) )
))
(declare-fun arrayNoDuplicates!0 (array!49861 (_ BitVec 32) List!16963) Bool)

(assert (=> b!866378 (= res!588420 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16960))))

(declare-fun b!866379 () Bool)

(declare-datatypes ((Unit!29628 0))(
  ( (Unit!29629) )
))
(declare-fun e!482710 () Unit!29628)

(declare-fun Unit!29630 () Unit!29628)

(assert (=> b!866379 (= e!482710 Unit!29630)))

(declare-fun b!866380 () Bool)

(declare-fun Unit!29631 () Unit!29628)

(assert (=> b!866380 (= e!482710 Unit!29631)))

(declare-fun lt!392549 () Unit!29628)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49861 (_ BitVec 32) (_ BitVec 32)) Unit!29628)

(assert (=> b!866380 (= lt!392549 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866380 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16960)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!392560 () Unit!29628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49861 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29628)

(assert (=> b!866380 (= lt!392560 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866380 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392561 () Unit!29628)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49861 (_ BitVec 64) (_ BitVec 32) List!16963) Unit!29628)

(assert (=> b!866380 (= lt!392561 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16960))))

(assert (=> b!866380 false))

(declare-fun b!866381 () Bool)

(declare-fun e!482716 () Bool)

(declare-fun e!482712 () Bool)

(assert (=> b!866381 (= e!482716 e!482712)))

(declare-fun res!588411 () Bool)

(assert (=> b!866381 (=> res!588411 e!482712)))

(assert (=> b!866381 (= res!588411 (= k0!854 (select (arr!23957 _keys!868) from!1053)))))

(assert (=> b!866381 (not (= (select (arr!23957 _keys!868) from!1053) k0!854))))

(declare-fun lt!392555 () Unit!29628)

(assert (=> b!866381 (= lt!392555 e!482710)))

(declare-fun c!92536 () Bool)

(assert (=> b!866381 (= c!92536 (= (select (arr!23957 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27481 0))(
  ( (V!27482 (val!8460 Int)) )
))
(declare-datatypes ((tuple2!11134 0))(
  ( (tuple2!11135 (_1!5578 (_ BitVec 64)) (_2!5578 V!27481)) )
))
(declare-datatypes ((List!16964 0))(
  ( (Nil!16961) (Cons!16960 (h!18097 tuple2!11134) (t!23911 List!16964)) )
))
(declare-datatypes ((ListLongMap!9905 0))(
  ( (ListLongMap!9906 (toList!4968 List!16964)) )
))
(declare-fun lt!392547 () ListLongMap!9905)

(declare-fun lt!392554 () ListLongMap!9905)

(assert (=> b!866381 (= lt!392547 lt!392554)))

(declare-fun lt!392553 () ListLongMap!9905)

(declare-fun lt!392551 () tuple2!11134)

(declare-fun +!2371 (ListLongMap!9905 tuple2!11134) ListLongMap!9905)

(assert (=> b!866381 (= lt!392554 (+!2371 lt!392553 lt!392551))))

(declare-fun lt!392550 () V!27481)

(assert (=> b!866381 (= lt!392551 (tuple2!11135 (select (arr!23957 _keys!868) from!1053) lt!392550))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7973 0))(
  ( (ValueCellFull!7973 (v!10885 V!27481)) (EmptyCell!7973) )
))
(declare-datatypes ((array!49863 0))(
  ( (array!49864 (arr!23958 (Array (_ BitVec 32) ValueCell!7973)) (size!24399 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49863)

(declare-fun get!12672 (ValueCell!7973 V!27481) V!27481)

(declare-fun dynLambda!1192 (Int (_ BitVec 64)) V!27481)

(assert (=> b!866381 (= lt!392550 (get!12672 (select (arr!23958 _values!688) from!1053) (dynLambda!1192 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866382 () Bool)

(declare-fun res!588414 () Bool)

(assert (=> b!866382 (=> (not res!588414) (not e!482714))))

(assert (=> b!866382 (= res!588414 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24398 _keys!868))))))

(declare-fun mapIsEmpty!26837 () Bool)

(declare-fun mapRes!26837 () Bool)

(assert (=> mapIsEmpty!26837 mapRes!26837))

(declare-fun b!866383 () Bool)

(declare-fun res!588421 () Bool)

(assert (=> b!866383 (=> (not res!588421) (not e!482714))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49861 (_ BitVec 32)) Bool)

(assert (=> b!866383 (= res!588421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26837 () Bool)

(declare-fun tp!51571 () Bool)

(declare-fun e!482713 () Bool)

(assert (=> mapNonEmpty!26837 (= mapRes!26837 (and tp!51571 e!482713))))

(declare-fun mapRest!26837 () (Array (_ BitVec 32) ValueCell!7973))

(declare-fun mapKey!26837 () (_ BitVec 32))

(declare-fun mapValue!26837 () ValueCell!7973)

(assert (=> mapNonEmpty!26837 (= (arr!23958 _values!688) (store mapRest!26837 mapKey!26837 mapValue!26837))))

(declare-fun b!866384 () Bool)

(declare-fun e!482715 () Bool)

(declare-fun e!482711 () Bool)

(assert (=> b!866384 (= e!482715 (and e!482711 mapRes!26837))))

(declare-fun condMapEmpty!26837 () Bool)

(declare-fun mapDefault!26837 () ValueCell!7973)

(assert (=> b!866384 (= condMapEmpty!26837 (= (arr!23958 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7973)) mapDefault!26837)))))

(declare-fun b!866385 () Bool)

(declare-fun res!588419 () Bool)

(assert (=> b!866385 (=> (not res!588419) (not e!482714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866385 (= res!588419 (validMask!0 mask!1196))))

(declare-fun b!866386 () Bool)

(declare-fun e!482708 () Bool)

(assert (=> b!866386 (= e!482708 (not e!482716))))

(declare-fun res!588416 () Bool)

(assert (=> b!866386 (=> res!588416 e!482716)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866386 (= res!588416 (not (validKeyInArray!0 (select (arr!23957 _keys!868) from!1053))))))

(declare-fun lt!392557 () ListLongMap!9905)

(assert (=> b!866386 (= lt!392557 lt!392553)))

(declare-fun lt!392559 () ListLongMap!9905)

(declare-fun lt!392546 () tuple2!11134)

(assert (=> b!866386 (= lt!392553 (+!2371 lt!392559 lt!392546))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27481)

(declare-fun zeroValue!654 () V!27481)

(declare-fun lt!392548 () array!49863)

(declare-fun getCurrentListMapNoExtraKeys!3017 (array!49861 array!49863 (_ BitVec 32) (_ BitVec 32) V!27481 V!27481 (_ BitVec 32) Int) ListLongMap!9905)

(assert (=> b!866386 (= lt!392557 (getCurrentListMapNoExtraKeys!3017 _keys!868 lt!392548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27481)

(assert (=> b!866386 (= lt!392546 (tuple2!11135 k0!854 v!557))))

(assert (=> b!866386 (= lt!392559 (getCurrentListMapNoExtraKeys!3017 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392558 () Unit!29628)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!552 (array!49861 array!49863 (_ BitVec 32) (_ BitVec 32) V!27481 V!27481 (_ BitVec 32) (_ BitVec 64) V!27481 (_ BitVec 32) Int) Unit!29628)

(assert (=> b!866386 (= lt!392558 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!552 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866387 () Bool)

(assert (=> b!866387 (= e!482712 true)))

(assert (=> b!866387 (= lt!392554 (+!2371 (+!2371 lt!392559 lt!392551) lt!392546))))

(declare-fun lt!392552 () Unit!29628)

(declare-fun addCommutativeForDiffKeys!517 (ListLongMap!9905 (_ BitVec 64) V!27481 (_ BitVec 64) V!27481) Unit!29628)

(assert (=> b!866387 (= lt!392552 (addCommutativeForDiffKeys!517 lt!392559 k0!854 v!557 (select (arr!23957 _keys!868) from!1053) lt!392550))))

(declare-fun b!866388 () Bool)

(declare-fun tp_is_empty!16825 () Bool)

(assert (=> b!866388 (= e!482713 tp_is_empty!16825)))

(declare-fun res!588418 () Bool)

(assert (=> start!73942 (=> (not res!588418) (not e!482714))))

(assert (=> start!73942 (= res!588418 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24398 _keys!868))))))

(assert (=> start!73942 e!482714))

(assert (=> start!73942 tp_is_empty!16825))

(assert (=> start!73942 true))

(assert (=> start!73942 tp!51572))

(declare-fun array_inv!18996 (array!49861) Bool)

(assert (=> start!73942 (array_inv!18996 _keys!868)))

(declare-fun array_inv!18997 (array!49863) Bool)

(assert (=> start!73942 (and (array_inv!18997 _values!688) e!482715)))

(declare-fun b!866389 () Bool)

(assert (=> b!866389 (= e!482714 e!482708)))

(declare-fun res!588413 () Bool)

(assert (=> b!866389 (=> (not res!588413) (not e!482708))))

(assert (=> b!866389 (= res!588413 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866389 (= lt!392547 (getCurrentListMapNoExtraKeys!3017 _keys!868 lt!392548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866389 (= lt!392548 (array!49864 (store (arr!23958 _values!688) i!612 (ValueCellFull!7973 v!557)) (size!24399 _values!688)))))

(declare-fun lt!392556 () ListLongMap!9905)

(assert (=> b!866389 (= lt!392556 (getCurrentListMapNoExtraKeys!3017 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866390 () Bool)

(declare-fun res!588412 () Bool)

(assert (=> b!866390 (=> (not res!588412) (not e!482714))))

(assert (=> b!866390 (= res!588412 (validKeyInArray!0 k0!854))))

(declare-fun b!866391 () Bool)

(declare-fun res!588415 () Bool)

(assert (=> b!866391 (=> (not res!588415) (not e!482714))))

(assert (=> b!866391 (= res!588415 (and (= (select (arr!23957 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866392 () Bool)

(declare-fun res!588417 () Bool)

(assert (=> b!866392 (=> (not res!588417) (not e!482714))))

(assert (=> b!866392 (= res!588417 (and (= (size!24399 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24398 _keys!868) (size!24399 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866393 () Bool)

(assert (=> b!866393 (= e!482711 tp_is_empty!16825)))

(assert (= (and start!73942 res!588418) b!866385))

(assert (= (and b!866385 res!588419) b!866392))

(assert (= (and b!866392 res!588417) b!866383))

(assert (= (and b!866383 res!588421) b!866378))

(assert (= (and b!866378 res!588420) b!866382))

(assert (= (and b!866382 res!588414) b!866390))

(assert (= (and b!866390 res!588412) b!866391))

(assert (= (and b!866391 res!588415) b!866389))

(assert (= (and b!866389 res!588413) b!866386))

(assert (= (and b!866386 (not res!588416)) b!866381))

(assert (= (and b!866381 c!92536) b!866380))

(assert (= (and b!866381 (not c!92536)) b!866379))

(assert (= (and b!866381 (not res!588411)) b!866387))

(assert (= (and b!866384 condMapEmpty!26837) mapIsEmpty!26837))

(assert (= (and b!866384 (not condMapEmpty!26837)) mapNonEmpty!26837))

(get-info :version)

(assert (= (and mapNonEmpty!26837 ((_ is ValueCellFull!7973) mapValue!26837)) b!866388))

(assert (= (and b!866384 ((_ is ValueCellFull!7973) mapDefault!26837)) b!866393))

(assert (= start!73942 b!866384))

(declare-fun b_lambda!12055 () Bool)

(assert (=> (not b_lambda!12055) (not b!866381)))

(declare-fun t!23909 () Bool)

(declare-fun tb!4803 () Bool)

(assert (=> (and start!73942 (= defaultEntry!696 defaultEntry!696) t!23909) tb!4803))

(declare-fun result!9225 () Bool)

(assert (=> tb!4803 (= result!9225 tp_is_empty!16825)))

(assert (=> b!866381 t!23909))

(declare-fun b_and!24369 () Bool)

(assert (= b_and!24367 (and (=> t!23909 result!9225) b_and!24369)))

(declare-fun m!808271 () Bool)

(assert (=> b!866390 m!808271))

(declare-fun m!808273 () Bool)

(assert (=> b!866389 m!808273))

(declare-fun m!808275 () Bool)

(assert (=> b!866389 m!808275))

(declare-fun m!808277 () Bool)

(assert (=> b!866389 m!808277))

(declare-fun m!808279 () Bool)

(assert (=> b!866385 m!808279))

(declare-fun m!808281 () Bool)

(assert (=> b!866387 m!808281))

(assert (=> b!866387 m!808281))

(declare-fun m!808283 () Bool)

(assert (=> b!866387 m!808283))

(declare-fun m!808285 () Bool)

(assert (=> b!866387 m!808285))

(assert (=> b!866387 m!808285))

(declare-fun m!808287 () Bool)

(assert (=> b!866387 m!808287))

(declare-fun m!808289 () Bool)

(assert (=> b!866381 m!808289))

(declare-fun m!808291 () Bool)

(assert (=> b!866381 m!808291))

(declare-fun m!808293 () Bool)

(assert (=> b!866381 m!808293))

(declare-fun m!808295 () Bool)

(assert (=> b!866381 m!808295))

(assert (=> b!866381 m!808291))

(assert (=> b!866381 m!808285))

(assert (=> b!866381 m!808293))

(declare-fun m!808297 () Bool)

(assert (=> start!73942 m!808297))

(declare-fun m!808299 () Bool)

(assert (=> start!73942 m!808299))

(declare-fun m!808301 () Bool)

(assert (=> mapNonEmpty!26837 m!808301))

(declare-fun m!808303 () Bool)

(assert (=> b!866386 m!808303))

(declare-fun m!808305 () Bool)

(assert (=> b!866386 m!808305))

(assert (=> b!866386 m!808285))

(declare-fun m!808307 () Bool)

(assert (=> b!866386 m!808307))

(assert (=> b!866386 m!808285))

(declare-fun m!808309 () Bool)

(assert (=> b!866386 m!808309))

(declare-fun m!808311 () Bool)

(assert (=> b!866386 m!808311))

(declare-fun m!808313 () Bool)

(assert (=> b!866391 m!808313))

(declare-fun m!808315 () Bool)

(assert (=> b!866383 m!808315))

(declare-fun m!808317 () Bool)

(assert (=> b!866380 m!808317))

(declare-fun m!808319 () Bool)

(assert (=> b!866380 m!808319))

(declare-fun m!808321 () Bool)

(assert (=> b!866380 m!808321))

(declare-fun m!808323 () Bool)

(assert (=> b!866380 m!808323))

(declare-fun m!808325 () Bool)

(assert (=> b!866380 m!808325))

(declare-fun m!808327 () Bool)

(assert (=> b!866378 m!808327))

(check-sat (not start!73942) (not b!866378) (not b!866387) b_and!24369 (not mapNonEmpty!26837) (not b!866380) (not b_lambda!12055) (not b!866389) (not b!866383) (not b!866390) tp_is_empty!16825 (not b_next!14689) (not b!866385) (not b!866386) (not b!866381))
(check-sat b_and!24369 (not b_next!14689))
