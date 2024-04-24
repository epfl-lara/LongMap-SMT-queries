; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73180 () Bool)

(assert start!73180)

(declare-fun b_free!13927 () Bool)

(declare-fun b_next!13927 () Bool)

(assert (=> start!73180 (= b_free!13927 (not b_next!13927))))

(declare-fun tp!49286 () Bool)

(declare-fun b_and!23023 () Bool)

(assert (=> start!73180 (= tp!49286 b_and!23023)))

(declare-fun b!849342 () Bool)

(declare-fun res!576779 () Bool)

(declare-fun e!473969 () Bool)

(assert (=> b!849342 (=> (not res!576779) (not e!473969))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48385 0))(
  ( (array!48386 (arr!23219 (Array (_ BitVec 32) (_ BitVec 64))) (size!23660 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48385)

(declare-datatypes ((V!26465 0))(
  ( (V!26466 (val!8079 Int)) )
))
(declare-datatypes ((ValueCell!7592 0))(
  ( (ValueCellFull!7592 (v!10504 V!26465)) (EmptyCell!7592) )
))
(declare-datatypes ((array!48387 0))(
  ( (array!48388 (arr!23220 (Array (_ BitVec 32) ValueCell!7592)) (size!23661 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48387)

(assert (=> b!849342 (= res!576779 (and (= (size!23661 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23660 _keys!868) (size!23661 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849343 () Bool)

(declare-fun res!576775 () Bool)

(assert (=> b!849343 (=> (not res!576775) (not e!473969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48385 (_ BitVec 32)) Bool)

(assert (=> b!849343 (= res!576775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!26465)

(declare-fun b!849344 () Bool)

(declare-fun e!473973 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!10492 0))(
  ( (tuple2!10493 (_1!5257 (_ BitVec 64)) (_2!5257 V!26465)) )
))
(declare-datatypes ((List!16362 0))(
  ( (Nil!16359) (Cons!16358 (h!17495 tuple2!10492) (t!22727 List!16362)) )
))
(declare-datatypes ((ListLongMap!9263 0))(
  ( (ListLongMap!9264 (toList!4647 List!16362)) )
))
(declare-fun call!37682 () ListLongMap!9263)

(declare-fun call!37681 () ListLongMap!9263)

(declare-fun +!2103 (ListLongMap!9263 tuple2!10492) ListLongMap!9263)

(assert (=> b!849344 (= e!473973 (= call!37681 (+!2103 call!37682 (tuple2!10493 k0!854 v!557))))))

(declare-fun b!849345 () Bool)

(declare-fun e!473974 () Bool)

(assert (=> b!849345 (= e!473969 e!473974)))

(declare-fun res!576781 () Bool)

(assert (=> b!849345 (=> (not res!576781) (not e!473974))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849345 (= res!576781 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!382380 () ListLongMap!9263)

(declare-fun minValue!654 () V!26465)

(declare-fun zeroValue!654 () V!26465)

(declare-fun lt!382381 () array!48387)

(declare-fun getCurrentListMapNoExtraKeys!2705 (array!48385 array!48387 (_ BitVec 32) (_ BitVec 32) V!26465 V!26465 (_ BitVec 32) Int) ListLongMap!9263)

(assert (=> b!849345 (= lt!382380 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!382381 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849345 (= lt!382381 (array!48388 (store (arr!23220 _values!688) i!612 (ValueCellFull!7592 v!557)) (size!23661 _values!688)))))

(declare-fun lt!382379 () ListLongMap!9263)

(assert (=> b!849345 (= lt!382379 (getCurrentListMapNoExtraKeys!2705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849346 () Bool)

(declare-fun res!576774 () Bool)

(assert (=> b!849346 (=> (not res!576774) (not e!473969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849346 (= res!576774 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25694 () Bool)

(declare-fun mapRes!25694 () Bool)

(assert (=> mapIsEmpty!25694 mapRes!25694))

(declare-fun b!849347 () Bool)

(declare-fun res!576777 () Bool)

(assert (=> b!849347 (=> (not res!576777) (not e!473969))))

(assert (=> b!849347 (= res!576777 (and (= (select (arr!23219 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849348 () Bool)

(declare-fun e!473967 () Bool)

(declare-fun tp_is_empty!16063 () Bool)

(assert (=> b!849348 (= e!473967 tp_is_empty!16063)))

(declare-fun b!849349 () Bool)

(declare-fun e!473970 () Bool)

(assert (=> b!849349 (= e!473974 (not e!473970))))

(declare-fun res!576772 () Bool)

(assert (=> b!849349 (=> res!576772 e!473970)))

(assert (=> b!849349 (= res!576772 (not (validKeyInArray!0 (select (arr!23219 _keys!868) from!1053))))))

(assert (=> b!849349 e!473973))

(declare-fun c!91843 () Bool)

(assert (=> b!849349 (= c!91843 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28982 0))(
  ( (Unit!28983) )
))
(declare-fun lt!382382 () Unit!28982)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!327 (array!48385 array!48387 (_ BitVec 32) (_ BitVec 32) V!26465 V!26465 (_ BitVec 32) (_ BitVec 64) V!26465 (_ BitVec 32) Int) Unit!28982)

(assert (=> b!849349 (= lt!382382 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!327 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849350 () Bool)

(declare-fun e!473971 () Bool)

(assert (=> b!849350 (= e!473971 (and e!473967 mapRes!25694))))

(declare-fun condMapEmpty!25694 () Bool)

(declare-fun mapDefault!25694 () ValueCell!7592)

(assert (=> b!849350 (= condMapEmpty!25694 (= (arr!23220 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7592)) mapDefault!25694)))))

(declare-fun b!849351 () Bool)

(declare-fun res!576773 () Bool)

(assert (=> b!849351 (=> (not res!576773) (not e!473969))))

(declare-datatypes ((List!16363 0))(
  ( (Nil!16360) (Cons!16359 (h!17496 (_ BitVec 64)) (t!22728 List!16363)) )
))
(declare-fun arrayNoDuplicates!0 (array!48385 (_ BitVec 32) List!16363) Bool)

(assert (=> b!849351 (= res!576773 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16360))))

(declare-fun b!849352 () Bool)

(declare-fun res!576778 () Bool)

(assert (=> b!849352 (=> (not res!576778) (not e!473969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849352 (= res!576778 (validMask!0 mask!1196))))

(declare-fun b!849353 () Bool)

(declare-fun res!576780 () Bool)

(assert (=> b!849353 (=> (not res!576780) (not e!473969))))

(assert (=> b!849353 (= res!576780 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23660 _keys!868))))))

(declare-fun bm!37678 () Bool)

(assert (=> bm!37678 (= call!37681 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!382381 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849354 () Bool)

(declare-fun e!473968 () Bool)

(assert (=> b!849354 (= e!473968 tp_is_empty!16063)))

(declare-fun res!576776 () Bool)

(assert (=> start!73180 (=> (not res!576776) (not e!473969))))

(assert (=> start!73180 (= res!576776 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23660 _keys!868))))))

(assert (=> start!73180 e!473969))

(assert (=> start!73180 tp_is_empty!16063))

(assert (=> start!73180 true))

(assert (=> start!73180 tp!49286))

(declare-fun array_inv!18488 (array!48385) Bool)

(assert (=> start!73180 (array_inv!18488 _keys!868)))

(declare-fun array_inv!18489 (array!48387) Bool)

(assert (=> start!73180 (and (array_inv!18489 _values!688) e!473971)))

(declare-fun bm!37679 () Bool)

(assert (=> bm!37679 (= call!37682 (getCurrentListMapNoExtraKeys!2705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25694 () Bool)

(declare-fun tp!49285 () Bool)

(assert (=> mapNonEmpty!25694 (= mapRes!25694 (and tp!49285 e!473968))))

(declare-fun mapRest!25694 () (Array (_ BitVec 32) ValueCell!7592))

(declare-fun mapValue!25694 () ValueCell!7592)

(declare-fun mapKey!25694 () (_ BitVec 32))

(assert (=> mapNonEmpty!25694 (= (arr!23220 _values!688) (store mapRest!25694 mapKey!25694 mapValue!25694))))

(declare-fun b!849355 () Bool)

(assert (=> b!849355 (= e!473970 true)))

(declare-fun get!12208 (ValueCell!7592 V!26465) V!26465)

(declare-fun dynLambda!982 (Int (_ BitVec 64)) V!26465)

(assert (=> b!849355 (= lt!382380 (+!2103 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!382381 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10493 (select (arr!23219 _keys!868) from!1053) (get!12208 (select (arr!23220 lt!382381) from!1053) (dynLambda!982 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849356 () Bool)

(assert (=> b!849356 (= e!473973 (= call!37681 call!37682))))

(assert (= (and start!73180 res!576776) b!849352))

(assert (= (and b!849352 res!576778) b!849342))

(assert (= (and b!849342 res!576779) b!849343))

(assert (= (and b!849343 res!576775) b!849351))

(assert (= (and b!849351 res!576773) b!849353))

(assert (= (and b!849353 res!576780) b!849346))

(assert (= (and b!849346 res!576774) b!849347))

(assert (= (and b!849347 res!576777) b!849345))

(assert (= (and b!849345 res!576781) b!849349))

(assert (= (and b!849349 c!91843) b!849344))

(assert (= (and b!849349 (not c!91843)) b!849356))

(assert (= (or b!849344 b!849356) bm!37678))

(assert (= (or b!849344 b!849356) bm!37679))

(assert (= (and b!849349 (not res!576772)) b!849355))

(assert (= (and b!849350 condMapEmpty!25694) mapIsEmpty!25694))

(assert (= (and b!849350 (not condMapEmpty!25694)) mapNonEmpty!25694))

(get-info :version)

(assert (= (and mapNonEmpty!25694 ((_ is ValueCellFull!7592) mapValue!25694)) b!849354))

(assert (= (and b!849350 ((_ is ValueCellFull!7592) mapDefault!25694)) b!849348))

(assert (= start!73180 b!849350))

(declare-fun b_lambda!11473 () Bool)

(assert (=> (not b_lambda!11473) (not b!849355)))

(declare-fun t!22726 () Bool)

(declare-fun tb!4221 () Bool)

(assert (=> (and start!73180 (= defaultEntry!696 defaultEntry!696) t!22726) tb!4221))

(declare-fun result!8061 () Bool)

(assert (=> tb!4221 (= result!8061 tp_is_empty!16063)))

(assert (=> b!849355 t!22726))

(declare-fun b_and!23025 () Bool)

(assert (= b_and!23023 (and (=> t!22726 result!8061) b_and!23025)))

(declare-fun m!790517 () Bool)

(assert (=> b!849343 m!790517))

(declare-fun m!790519 () Bool)

(assert (=> start!73180 m!790519))

(declare-fun m!790521 () Bool)

(assert (=> start!73180 m!790521))

(declare-fun m!790523 () Bool)

(assert (=> b!849345 m!790523))

(declare-fun m!790525 () Bool)

(assert (=> b!849345 m!790525))

(declare-fun m!790527 () Bool)

(assert (=> b!849345 m!790527))

(declare-fun m!790529 () Bool)

(assert (=> mapNonEmpty!25694 m!790529))

(declare-fun m!790531 () Bool)

(assert (=> b!849352 m!790531))

(declare-fun m!790533 () Bool)

(assert (=> b!849344 m!790533))

(declare-fun m!790535 () Bool)

(assert (=> b!849351 m!790535))

(declare-fun m!790537 () Bool)

(assert (=> b!849349 m!790537))

(assert (=> b!849349 m!790537))

(declare-fun m!790539 () Bool)

(assert (=> b!849349 m!790539))

(declare-fun m!790541 () Bool)

(assert (=> b!849349 m!790541))

(declare-fun m!790543 () Bool)

(assert (=> bm!37678 m!790543))

(declare-fun m!790545 () Bool)

(assert (=> b!849346 m!790545))

(declare-fun m!790547 () Bool)

(assert (=> b!849347 m!790547))

(declare-fun m!790549 () Bool)

(assert (=> bm!37679 m!790549))

(assert (=> b!849355 m!790543))

(declare-fun m!790551 () Bool)

(assert (=> b!849355 m!790551))

(declare-fun m!790553 () Bool)

(assert (=> b!849355 m!790553))

(assert (=> b!849355 m!790537))

(declare-fun m!790555 () Bool)

(assert (=> b!849355 m!790555))

(assert (=> b!849355 m!790553))

(assert (=> b!849355 m!790555))

(declare-fun m!790557 () Bool)

(assert (=> b!849355 m!790557))

(assert (=> b!849355 m!790543))

(check-sat (not bm!37678) (not b_next!13927) (not b!849343) (not b!849355) (not start!73180) b_and!23025 (not b!849352) (not b!849351) (not b_lambda!11473) (not bm!37679) (not b!849346) (not b!849345) (not b!849344) (not mapNonEmpty!25694) tp_is_empty!16063 (not b!849349))
(check-sat b_and!23025 (not b_next!13927))
