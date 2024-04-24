; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73222 () Bool)

(assert start!73222)

(declare-fun b_free!13969 () Bool)

(declare-fun b_next!13969 () Bool)

(assert (=> start!73222 (= b_free!13969 (not b_next!13969))))

(declare-fun tp!49411 () Bool)

(declare-fun b_and!23107 () Bool)

(assert (=> start!73222 (= tp!49411 b_and!23107)))

(declare-fun b!850329 () Bool)

(declare-fun res!577404 () Bool)

(declare-fun e!474477 () Bool)

(assert (=> b!850329 (=> (not res!577404) (not e!474477))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48467 0))(
  ( (array!48468 (arr!23260 (Array (_ BitVec 32) (_ BitVec 64))) (size!23701 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48467)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!850329 (= res!577404 (and (= (select (arr!23260 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26521 0))(
  ( (V!26522 (val!8100 Int)) )
))
(declare-datatypes ((ValueCell!7613 0))(
  ( (ValueCellFull!7613 (v!10525 V!26521)) (EmptyCell!7613) )
))
(declare-datatypes ((array!48469 0))(
  ( (array!48470 (arr!23261 (Array (_ BitVec 32) ValueCell!7613)) (size!23702 (_ BitVec 32))) )
))
(declare-fun lt!382634 () array!48469)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10532 0))(
  ( (tuple2!10533 (_1!5277 (_ BitVec 64)) (_2!5277 V!26521)) )
))
(declare-datatypes ((List!16399 0))(
  ( (Nil!16396) (Cons!16395 (h!17532 tuple2!10532) (t!22806 List!16399)) )
))
(declare-datatypes ((ListLongMap!9303 0))(
  ( (ListLongMap!9304 (toList!4667 List!16399)) )
))
(declare-fun call!37808 () ListLongMap!9303)

(declare-fun bm!37804 () Bool)

(declare-fun minValue!654 () V!26521)

(declare-fun zeroValue!654 () V!26521)

(declare-fun getCurrentListMapNoExtraKeys!2725 (array!48467 array!48469 (_ BitVec 32) (_ BitVec 32) V!26521 V!26521 (_ BitVec 32) Int) ListLongMap!9303)

(assert (=> bm!37804 (= call!37808 (getCurrentListMapNoExtraKeys!2725 _keys!868 lt!382634 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850330 () Bool)

(declare-fun e!474474 () Bool)

(assert (=> b!850330 (= e!474477 e!474474)))

(declare-fun res!577410 () Bool)

(assert (=> b!850330 (=> (not res!577410) (not e!474474))))

(assert (=> b!850330 (= res!577410 (= from!1053 i!612))))

(declare-fun lt!382633 () ListLongMap!9303)

(assert (=> b!850330 (= lt!382633 (getCurrentListMapNoExtraKeys!2725 _keys!868 lt!382634 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26521)

(declare-fun _values!688 () array!48469)

(assert (=> b!850330 (= lt!382634 (array!48470 (store (arr!23261 _values!688) i!612 (ValueCellFull!7613 v!557)) (size!23702 _values!688)))))

(declare-fun lt!382632 () ListLongMap!9303)

(assert (=> b!850330 (= lt!382632 (getCurrentListMapNoExtraKeys!2725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850331 () Bool)

(declare-fun e!474475 () Bool)

(declare-fun tp_is_empty!16105 () Bool)

(assert (=> b!850331 (= e!474475 tp_is_empty!16105)))

(declare-fun b!850332 () Bool)

(declare-fun res!577407 () Bool)

(assert (=> b!850332 (=> (not res!577407) (not e!474477))))

(assert (=> b!850332 (= res!577407 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23701 _keys!868))))))

(declare-fun b!850333 () Bool)

(declare-fun res!577405 () Bool)

(assert (=> b!850333 (=> (not res!577405) (not e!474477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850333 (= res!577405 (validMask!0 mask!1196))))

(declare-fun b!850334 () Bool)

(declare-fun res!577408 () Bool)

(assert (=> b!850334 (=> (not res!577408) (not e!474477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850334 (= res!577408 (validKeyInArray!0 k0!854))))

(declare-fun b!850335 () Bool)

(declare-fun res!577409 () Bool)

(assert (=> b!850335 (=> (not res!577409) (not e!474477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48467 (_ BitVec 32)) Bool)

(assert (=> b!850335 (= res!577409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850336 () Bool)

(declare-fun e!474472 () Bool)

(assert (=> b!850336 (= e!474472 true)))

(declare-fun +!2118 (ListLongMap!9303 tuple2!10532) ListLongMap!9303)

(declare-fun get!12237 (ValueCell!7613 V!26521) V!26521)

(declare-fun dynLambda!997 (Int (_ BitVec 64)) V!26521)

(assert (=> b!850336 (= lt!382633 (+!2118 (getCurrentListMapNoExtraKeys!2725 _keys!868 lt!382634 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10533 (select (arr!23260 _keys!868) from!1053) (get!12237 (select (arr!23261 lt!382634) from!1053) (dynLambda!997 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!850337 () Bool)

(declare-fun res!577411 () Bool)

(assert (=> b!850337 (=> (not res!577411) (not e!474477))))

(assert (=> b!850337 (= res!577411 (and (= (size!23702 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23701 _keys!868) (size!23702 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun call!37807 () ListLongMap!9303)

(declare-fun e!474473 () Bool)

(declare-fun b!850338 () Bool)

(assert (=> b!850338 (= e!474473 (= call!37808 (+!2118 call!37807 (tuple2!10533 k0!854 v!557))))))

(declare-fun mapNonEmpty!25757 () Bool)

(declare-fun mapRes!25757 () Bool)

(declare-fun tp!49412 () Bool)

(declare-fun e!474476 () Bool)

(assert (=> mapNonEmpty!25757 (= mapRes!25757 (and tp!49412 e!474476))))

(declare-fun mapValue!25757 () ValueCell!7613)

(declare-fun mapKey!25757 () (_ BitVec 32))

(declare-fun mapRest!25757 () (Array (_ BitVec 32) ValueCell!7613))

(assert (=> mapNonEmpty!25757 (= (arr!23261 _values!688) (store mapRest!25757 mapKey!25757 mapValue!25757))))

(declare-fun res!577406 () Bool)

(assert (=> start!73222 (=> (not res!577406) (not e!474477))))

(assert (=> start!73222 (= res!577406 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23701 _keys!868))))))

(assert (=> start!73222 e!474477))

(assert (=> start!73222 tp_is_empty!16105))

(assert (=> start!73222 true))

(assert (=> start!73222 tp!49411))

(declare-fun array_inv!18516 (array!48467) Bool)

(assert (=> start!73222 (array_inv!18516 _keys!868)))

(declare-fun e!474478 () Bool)

(declare-fun array_inv!18517 (array!48469) Bool)

(assert (=> start!73222 (and (array_inv!18517 _values!688) e!474478)))

(declare-fun b!850339 () Bool)

(assert (=> b!850339 (= e!474478 (and e!474475 mapRes!25757))))

(declare-fun condMapEmpty!25757 () Bool)

(declare-fun mapDefault!25757 () ValueCell!7613)

(assert (=> b!850339 (= condMapEmpty!25757 (= (arr!23261 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7613)) mapDefault!25757)))))

(declare-fun b!850340 () Bool)

(assert (=> b!850340 (= e!474473 (= call!37808 call!37807))))

(declare-fun bm!37805 () Bool)

(assert (=> bm!37805 (= call!37807 (getCurrentListMapNoExtraKeys!2725 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850341 () Bool)

(declare-fun res!577403 () Bool)

(assert (=> b!850341 (=> (not res!577403) (not e!474477))))

(declare-datatypes ((List!16400 0))(
  ( (Nil!16397) (Cons!16396 (h!17533 (_ BitVec 64)) (t!22807 List!16400)) )
))
(declare-fun arrayNoDuplicates!0 (array!48467 (_ BitVec 32) List!16400) Bool)

(assert (=> b!850341 (= res!577403 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16397))))

(declare-fun b!850342 () Bool)

(assert (=> b!850342 (= e!474474 (not e!474472))))

(declare-fun res!577402 () Bool)

(assert (=> b!850342 (=> res!577402 e!474472)))

(assert (=> b!850342 (= res!577402 (not (validKeyInArray!0 (select (arr!23260 _keys!868) from!1053))))))

(assert (=> b!850342 e!474473))

(declare-fun c!91906 () Bool)

(assert (=> b!850342 (= c!91906 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29004 0))(
  ( (Unit!29005) )
))
(declare-fun lt!382631 () Unit!29004)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!338 (array!48467 array!48469 (_ BitVec 32) (_ BitVec 32) V!26521 V!26521 (_ BitVec 32) (_ BitVec 64) V!26521 (_ BitVec 32) Int) Unit!29004)

(assert (=> b!850342 (= lt!382631 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!338 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850343 () Bool)

(assert (=> b!850343 (= e!474476 tp_is_empty!16105)))

(declare-fun mapIsEmpty!25757 () Bool)

(assert (=> mapIsEmpty!25757 mapRes!25757))

(assert (= (and start!73222 res!577406) b!850333))

(assert (= (and b!850333 res!577405) b!850337))

(assert (= (and b!850337 res!577411) b!850335))

(assert (= (and b!850335 res!577409) b!850341))

(assert (= (and b!850341 res!577403) b!850332))

(assert (= (and b!850332 res!577407) b!850334))

(assert (= (and b!850334 res!577408) b!850329))

(assert (= (and b!850329 res!577404) b!850330))

(assert (= (and b!850330 res!577410) b!850342))

(assert (= (and b!850342 c!91906) b!850338))

(assert (= (and b!850342 (not c!91906)) b!850340))

(assert (= (or b!850338 b!850340) bm!37804))

(assert (= (or b!850338 b!850340) bm!37805))

(assert (= (and b!850342 (not res!577402)) b!850336))

(assert (= (and b!850339 condMapEmpty!25757) mapIsEmpty!25757))

(assert (= (and b!850339 (not condMapEmpty!25757)) mapNonEmpty!25757))

(get-info :version)

(assert (= (and mapNonEmpty!25757 ((_ is ValueCellFull!7613) mapValue!25757)) b!850343))

(assert (= (and b!850339 ((_ is ValueCellFull!7613) mapDefault!25757)) b!850331))

(assert (= start!73222 b!850339))

(declare-fun b_lambda!11515 () Bool)

(assert (=> (not b_lambda!11515) (not b!850336)))

(declare-fun t!22805 () Bool)

(declare-fun tb!4263 () Bool)

(assert (=> (and start!73222 (= defaultEntry!696 defaultEntry!696) t!22805) tb!4263))

(declare-fun result!8145 () Bool)

(assert (=> tb!4263 (= result!8145 tp_is_empty!16105)))

(assert (=> b!850336 t!22805))

(declare-fun b_and!23109 () Bool)

(assert (= b_and!23107 (and (=> t!22805 result!8145) b_and!23109)))

(declare-fun m!791401 () Bool)

(assert (=> b!850341 m!791401))

(declare-fun m!791403 () Bool)

(assert (=> b!850329 m!791403))

(declare-fun m!791405 () Bool)

(assert (=> bm!37805 m!791405))

(declare-fun m!791407 () Bool)

(assert (=> b!850338 m!791407))

(declare-fun m!791409 () Bool)

(assert (=> b!850334 m!791409))

(declare-fun m!791411 () Bool)

(assert (=> b!850330 m!791411))

(declare-fun m!791413 () Bool)

(assert (=> b!850330 m!791413))

(declare-fun m!791415 () Bool)

(assert (=> b!850330 m!791415))

(declare-fun m!791417 () Bool)

(assert (=> b!850335 m!791417))

(declare-fun m!791419 () Bool)

(assert (=> b!850333 m!791419))

(declare-fun m!791421 () Bool)

(assert (=> b!850336 m!791421))

(assert (=> b!850336 m!791421))

(declare-fun m!791423 () Bool)

(assert (=> b!850336 m!791423))

(declare-fun m!791425 () Bool)

(assert (=> b!850336 m!791425))

(declare-fun m!791427 () Bool)

(assert (=> b!850336 m!791427))

(declare-fun m!791429 () Bool)

(assert (=> b!850336 m!791429))

(assert (=> b!850336 m!791425))

(declare-fun m!791431 () Bool)

(assert (=> b!850336 m!791431))

(assert (=> b!850336 m!791427))

(assert (=> bm!37804 m!791421))

(declare-fun m!791433 () Bool)

(assert (=> start!73222 m!791433))

(declare-fun m!791435 () Bool)

(assert (=> start!73222 m!791435))

(assert (=> b!850342 m!791431))

(assert (=> b!850342 m!791431))

(declare-fun m!791437 () Bool)

(assert (=> b!850342 m!791437))

(declare-fun m!791439 () Bool)

(assert (=> b!850342 m!791439))

(declare-fun m!791441 () Bool)

(assert (=> mapNonEmpty!25757 m!791441))

(check-sat (not b!850338) (not b!850335) (not b!850334) (not bm!37804) (not b!850341) (not bm!37805) b_and!23109 (not mapNonEmpty!25757) (not b!850333) (not b_next!13969) (not b_lambda!11515) (not start!73222) (not b!850330) tp_is_empty!16105 (not b!850336) (not b!850342))
(check-sat b_and!23109 (not b_next!13969))
