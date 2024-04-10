; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73140 () Bool)

(assert start!73140)

(declare-fun b_free!14055 () Bool)

(declare-fun b_next!14055 () Bool)

(assert (=> start!73140 (= b_free!14055 (not b_next!14055))))

(declare-fun tp!49669 () Bool)

(declare-fun b_and!23269 () Bool)

(assert (=> start!73140 (= tp!49669 b_and!23269)))

(declare-fun b!851447 () Bool)

(declare-fun res!578354 () Bool)

(declare-fun e!474927 () Bool)

(assert (=> b!851447 (=> (not res!578354) (not e!474927))))

(declare-datatypes ((array!48582 0))(
  ( (array!48583 (arr!23322 (Array (_ BitVec 32) (_ BitVec 64))) (size!23762 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48582)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48582 (_ BitVec 32)) Bool)

(assert (=> b!851447 (= res!578354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851448 () Bool)

(declare-fun res!578351 () Bool)

(assert (=> b!851448 (=> (not res!578351) (not e!474927))))

(declare-datatypes ((List!16521 0))(
  ( (Nil!16518) (Cons!16517 (h!17648 (_ BitVec 64)) (t!23022 List!16521)) )
))
(declare-fun arrayNoDuplicates!0 (array!48582 (_ BitVec 32) List!16521) Bool)

(assert (=> b!851448 (= res!578351 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16518))))

(declare-fun b!851449 () Bool)

(declare-fun e!474925 () Bool)

(declare-fun tp_is_empty!16191 () Bool)

(assert (=> b!851449 (= e!474925 tp_is_empty!16191)))

(declare-fun b!851450 () Bool)

(declare-fun e!474923 () Bool)

(declare-datatypes ((V!26635 0))(
  ( (V!26636 (val!8143 Int)) )
))
(declare-datatypes ((tuple2!10684 0))(
  ( (tuple2!10685 (_1!5353 (_ BitVec 64)) (_2!5353 V!26635)) )
))
(declare-datatypes ((List!16522 0))(
  ( (Nil!16519) (Cons!16518 (h!17649 tuple2!10684) (t!23023 List!16522)) )
))
(declare-datatypes ((ListLongMap!9453 0))(
  ( (ListLongMap!9454 (toList!4742 List!16522)) )
))
(declare-fun call!38021 () ListLongMap!9453)

(declare-fun call!38020 () ListLongMap!9453)

(assert (=> b!851450 (= e!474923 (= call!38021 call!38020))))

(declare-fun res!578356 () Bool)

(assert (=> start!73140 (=> (not res!578356) (not e!474927))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73140 (= res!578356 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23762 _keys!868))))))

(assert (=> start!73140 e!474927))

(assert (=> start!73140 tp_is_empty!16191))

(assert (=> start!73140 true))

(assert (=> start!73140 tp!49669))

(declare-fun array_inv!18502 (array!48582) Bool)

(assert (=> start!73140 (array_inv!18502 _keys!868)))

(declare-datatypes ((ValueCell!7656 0))(
  ( (ValueCellFull!7656 (v!10568 V!26635)) (EmptyCell!7656) )
))
(declare-datatypes ((array!48584 0))(
  ( (array!48585 (arr!23323 (Array (_ BitVec 32) ValueCell!7656)) (size!23763 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48584)

(declare-fun e!474928 () Bool)

(declare-fun array_inv!18503 (array!48584) Bool)

(assert (=> start!73140 (and (array_inv!18503 _values!688) e!474928)))

(declare-fun mapNonEmpty!25886 () Bool)

(declare-fun mapRes!25886 () Bool)

(declare-fun tp!49668 () Bool)

(assert (=> mapNonEmpty!25886 (= mapRes!25886 (and tp!49668 e!474925))))

(declare-fun mapRest!25886 () (Array (_ BitVec 32) ValueCell!7656))

(declare-fun mapKey!25886 () (_ BitVec 32))

(declare-fun mapValue!25886 () ValueCell!7656)

(assert (=> mapNonEmpty!25886 (= (arr!23323 _values!688) (store mapRest!25886 mapKey!25886 mapValue!25886))))

(declare-fun v!557 () V!26635)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!851451 () Bool)

(declare-fun +!2142 (ListLongMap!9453 tuple2!10684) ListLongMap!9453)

(assert (=> b!851451 (= e!474923 (= call!38021 (+!2142 call!38020 (tuple2!10685 k0!854 v!557))))))

(declare-fun b!851452 () Bool)

(declare-fun e!474921 () Bool)

(assert (=> b!851452 (= e!474921 tp_is_empty!16191)))

(declare-fun b!851453 () Bool)

(declare-fun res!578357 () Bool)

(assert (=> b!851453 (=> (not res!578357) (not e!474927))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!851453 (= res!578357 (and (= (size!23763 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23762 _keys!868) (size!23763 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851454 () Bool)

(declare-fun res!578348 () Bool)

(assert (=> b!851454 (=> (not res!578348) (not e!474927))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851454 (= res!578348 (and (= (select (arr!23322 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851455 () Bool)

(declare-fun res!578355 () Bool)

(assert (=> b!851455 (=> (not res!578355) (not e!474927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851455 (= res!578355 (validMask!0 mask!1196))))

(declare-fun b!851456 () Bool)

(declare-fun e!474924 () Bool)

(assert (=> b!851456 (= e!474927 e!474924)))

(declare-fun res!578349 () Bool)

(assert (=> b!851456 (=> (not res!578349) (not e!474924))))

(assert (=> b!851456 (= res!578349 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!383464 () ListLongMap!9453)

(declare-fun lt!383472 () array!48584)

(declare-fun minValue!654 () V!26635)

(declare-fun zeroValue!654 () V!26635)

(declare-fun getCurrentListMapNoExtraKeys!2724 (array!48582 array!48584 (_ BitVec 32) (_ BitVec 32) V!26635 V!26635 (_ BitVec 32) Int) ListLongMap!9453)

(assert (=> b!851456 (= lt!383464 (getCurrentListMapNoExtraKeys!2724 _keys!868 lt!383472 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851456 (= lt!383472 (array!48585 (store (arr!23323 _values!688) i!612 (ValueCellFull!7656 v!557)) (size!23763 _values!688)))))

(declare-fun lt!383465 () ListLongMap!9453)

(assert (=> b!851456 (= lt!383465 (getCurrentListMapNoExtraKeys!2724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851457 () Bool)

(declare-fun res!578352 () Bool)

(assert (=> b!851457 (=> (not res!578352) (not e!474927))))

(assert (=> b!851457 (= res!578352 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23762 _keys!868))))))

(declare-fun b!851458 () Bool)

(declare-fun e!474926 () Bool)

(assert (=> b!851458 (= e!474926 true)))

(declare-fun lt!383473 () tuple2!10684)

(declare-fun lt!383470 () ListLongMap!9453)

(declare-fun lt!383467 () V!26635)

(assert (=> b!851458 (= (+!2142 lt!383470 lt!383473) (+!2142 (+!2142 lt!383470 (tuple2!10685 k0!854 lt!383467)) lt!383473))))

(declare-fun lt!383466 () V!26635)

(assert (=> b!851458 (= lt!383473 (tuple2!10685 k0!854 lt!383466))))

(declare-datatypes ((Unit!29073 0))(
  ( (Unit!29074) )
))
(declare-fun lt!383468 () Unit!29073)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!274 (ListLongMap!9453 (_ BitVec 64) V!26635 V!26635) Unit!29073)

(assert (=> b!851458 (= lt!383468 (addSameAsAddTwiceSameKeyDiffValues!274 lt!383470 k0!854 lt!383467 lt!383466))))

(declare-fun lt!383469 () V!26635)

(declare-fun get!12290 (ValueCell!7656 V!26635) V!26635)

(assert (=> b!851458 (= lt!383467 (get!12290 (select (arr!23323 _values!688) from!1053) lt!383469))))

(assert (=> b!851458 (= lt!383464 (+!2142 lt!383470 (tuple2!10685 (select (arr!23322 _keys!868) from!1053) lt!383466)))))

(assert (=> b!851458 (= lt!383466 (get!12290 (select (store (arr!23323 _values!688) i!612 (ValueCellFull!7656 v!557)) from!1053) lt!383469))))

(declare-fun dynLambda!1028 (Int (_ BitVec 64)) V!26635)

(assert (=> b!851458 (= lt!383469 (dynLambda!1028 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851458 (= lt!383470 (getCurrentListMapNoExtraKeys!2724 _keys!868 lt!383472 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25886 () Bool)

(assert (=> mapIsEmpty!25886 mapRes!25886))

(declare-fun b!851459 () Bool)

(declare-fun res!578353 () Bool)

(assert (=> b!851459 (=> (not res!578353) (not e!474927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851459 (= res!578353 (validKeyInArray!0 k0!854))))

(declare-fun bm!38017 () Bool)

(assert (=> bm!38017 (= call!38021 (getCurrentListMapNoExtraKeys!2724 _keys!868 lt!383472 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851460 () Bool)

(assert (=> b!851460 (= e!474924 (not e!474926))))

(declare-fun res!578350 () Bool)

(assert (=> b!851460 (=> res!578350 e!474926)))

(assert (=> b!851460 (= res!578350 (not (validKeyInArray!0 (select (arr!23322 _keys!868) from!1053))))))

(assert (=> b!851460 e!474923))

(declare-fun c!91753 () Bool)

(assert (=> b!851460 (= c!91753 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383471 () Unit!29073)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!378 (array!48582 array!48584 (_ BitVec 32) (_ BitVec 32) V!26635 V!26635 (_ BitVec 32) (_ BitVec 64) V!26635 (_ BitVec 32) Int) Unit!29073)

(assert (=> b!851460 (= lt!383471 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!378 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851461 () Bool)

(assert (=> b!851461 (= e!474928 (and e!474921 mapRes!25886))))

(declare-fun condMapEmpty!25886 () Bool)

(declare-fun mapDefault!25886 () ValueCell!7656)

(assert (=> b!851461 (= condMapEmpty!25886 (= (arr!23323 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7656)) mapDefault!25886)))))

(declare-fun bm!38018 () Bool)

(assert (=> bm!38018 (= call!38020 (getCurrentListMapNoExtraKeys!2724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73140 res!578356) b!851455))

(assert (= (and b!851455 res!578355) b!851453))

(assert (= (and b!851453 res!578357) b!851447))

(assert (= (and b!851447 res!578354) b!851448))

(assert (= (and b!851448 res!578351) b!851457))

(assert (= (and b!851457 res!578352) b!851459))

(assert (= (and b!851459 res!578353) b!851454))

(assert (= (and b!851454 res!578348) b!851456))

(assert (= (and b!851456 res!578349) b!851460))

(assert (= (and b!851460 c!91753) b!851451))

(assert (= (and b!851460 (not c!91753)) b!851450))

(assert (= (or b!851451 b!851450) bm!38017))

(assert (= (or b!851451 b!851450) bm!38018))

(assert (= (and b!851460 (not res!578350)) b!851458))

(assert (= (and b!851461 condMapEmpty!25886) mapIsEmpty!25886))

(assert (= (and b!851461 (not condMapEmpty!25886)) mapNonEmpty!25886))

(get-info :version)

(assert (= (and mapNonEmpty!25886 ((_ is ValueCellFull!7656) mapValue!25886)) b!851449))

(assert (= (and b!851461 ((_ is ValueCellFull!7656) mapDefault!25886)) b!851452))

(assert (= start!73140 b!851461))

(declare-fun b_lambda!11587 () Bool)

(assert (=> (not b_lambda!11587) (not b!851458)))

(declare-fun t!23021 () Bool)

(declare-fun tb!4357 () Bool)

(assert (=> (and start!73140 (= defaultEntry!696 defaultEntry!696) t!23021) tb!4357))

(declare-fun result!8325 () Bool)

(assert (=> tb!4357 (= result!8325 tp_is_empty!16191)))

(assert (=> b!851458 t!23021))

(declare-fun b_and!23271 () Bool)

(assert (= b_and!23269 (and (=> t!23021 result!8325) b_and!23271)))

(declare-fun m!792359 () Bool)

(assert (=> b!851459 m!792359))

(declare-fun m!792361 () Bool)

(assert (=> b!851448 m!792361))

(declare-fun m!792363 () Bool)

(assert (=> b!851454 m!792363))

(declare-fun m!792365 () Bool)

(assert (=> bm!38018 m!792365))

(declare-fun m!792367 () Bool)

(assert (=> bm!38017 m!792367))

(declare-fun m!792369 () Bool)

(assert (=> b!851455 m!792369))

(declare-fun m!792371 () Bool)

(assert (=> start!73140 m!792371))

(declare-fun m!792373 () Bool)

(assert (=> start!73140 m!792373))

(declare-fun m!792375 () Bool)

(assert (=> b!851456 m!792375))

(declare-fun m!792377 () Bool)

(assert (=> b!851456 m!792377))

(declare-fun m!792379 () Bool)

(assert (=> b!851456 m!792379))

(declare-fun m!792381 () Bool)

(assert (=> b!851460 m!792381))

(assert (=> b!851460 m!792381))

(declare-fun m!792383 () Bool)

(assert (=> b!851460 m!792383))

(declare-fun m!792385 () Bool)

(assert (=> b!851460 m!792385))

(declare-fun m!792387 () Bool)

(assert (=> b!851447 m!792387))

(declare-fun m!792389 () Bool)

(assert (=> mapNonEmpty!25886 m!792389))

(declare-fun m!792391 () Bool)

(assert (=> b!851458 m!792391))

(assert (=> b!851458 m!792367))

(declare-fun m!792393 () Bool)

(assert (=> b!851458 m!792393))

(declare-fun m!792395 () Bool)

(assert (=> b!851458 m!792395))

(assert (=> b!851458 m!792391))

(declare-fun m!792397 () Bool)

(assert (=> b!851458 m!792397))

(declare-fun m!792399 () Bool)

(assert (=> b!851458 m!792399))

(assert (=> b!851458 m!792377))

(declare-fun m!792401 () Bool)

(assert (=> b!851458 m!792401))

(declare-fun m!792403 () Bool)

(assert (=> b!851458 m!792403))

(assert (=> b!851458 m!792399))

(declare-fun m!792405 () Bool)

(assert (=> b!851458 m!792405))

(declare-fun m!792407 () Bool)

(assert (=> b!851458 m!792407))

(assert (=> b!851458 m!792401))

(assert (=> b!851458 m!792381))

(declare-fun m!792409 () Bool)

(assert (=> b!851458 m!792409))

(declare-fun m!792411 () Bool)

(assert (=> b!851451 m!792411))

(check-sat (not b_lambda!11587) (not b!851456) (not b!851458) (not bm!38017) (not start!73140) (not b!851451) tp_is_empty!16191 (not bm!38018) (not b!851460) (not b!851448) (not b_next!14055) (not b!851459) (not mapNonEmpty!25886) (not b!851447) (not b!851455) b_and!23271)
(check-sat b_and!23271 (not b_next!14055))
