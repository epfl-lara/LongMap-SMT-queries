; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73258 () Bool)

(assert start!73258)

(declare-fun b_free!14191 () Bool)

(declare-fun b_next!14191 () Bool)

(assert (=> start!73258 (= b_free!14191 (not b_next!14191))))

(declare-fun tp!50078 () Bool)

(declare-fun b_and!23515 () Bool)

(assert (=> start!73258 (= tp!50078 b_and!23515)))

(declare-fun mapNonEmpty!26090 () Bool)

(declare-fun mapRes!26090 () Bool)

(declare-fun tp!50077 () Bool)

(declare-fun e!476407 () Bool)

(assert (=> mapNonEmpty!26090 (= mapRes!26090 (and tp!50077 e!476407))))

(declare-datatypes ((V!26817 0))(
  ( (V!26818 (val!8211 Int)) )
))
(declare-datatypes ((ValueCell!7724 0))(
  ( (ValueCellFull!7724 (v!10630 V!26817)) (EmptyCell!7724) )
))
(declare-fun mapRest!26090 () (Array (_ BitVec 32) ValueCell!7724))

(declare-fun mapKey!26090 () (_ BitVec 32))

(declare-fun mapValue!26090 () ValueCell!7724)

(declare-datatypes ((array!48837 0))(
  ( (array!48838 (arr!23450 (Array (_ BitVec 32) ValueCell!7724)) (size!23892 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48837)

(assert (=> mapNonEmpty!26090 (= (arr!23450 _values!688) (store mapRest!26090 mapKey!26090 mapValue!26090))))

(declare-fun b!854404 () Bool)

(declare-fun res!580278 () Bool)

(declare-fun e!476406 () Bool)

(assert (=> b!854404 (=> (not res!580278) (not e!476406))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48839 0))(
  ( (array!48840 (arr!23451 (Array (_ BitVec 32) (_ BitVec 64))) (size!23893 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48839)

(assert (=> b!854404 (= res!580278 (and (= (size!23892 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23893 _keys!868) (size!23892 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26090 () Bool)

(assert (=> mapIsEmpty!26090 mapRes!26090))

(declare-fun b!854405 () Bool)

(declare-fun res!580284 () Bool)

(assert (=> b!854405 (=> (not res!580284) (not e!476406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48839 (_ BitVec 32)) Bool)

(assert (=> b!854405 (= res!580284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854406 () Bool)

(declare-fun e!476410 () Bool)

(declare-datatypes ((tuple2!10826 0))(
  ( (tuple2!10827 (_1!5424 (_ BitVec 64)) (_2!5424 V!26817)) )
))
(declare-datatypes ((List!16638 0))(
  ( (Nil!16635) (Cons!16634 (h!17765 tuple2!10826) (t!23266 List!16638)) )
))
(declare-datatypes ((ListLongMap!9585 0))(
  ( (ListLongMap!9586 (toList!4808 List!16638)) )
))
(declare-fun call!38403 () ListLongMap!9585)

(declare-fun call!38402 () ListLongMap!9585)

(assert (=> b!854406 (= e!476410 (= call!38403 call!38402))))

(declare-fun b!854407 () Bool)

(declare-fun e!476411 () Bool)

(declare-fun tp_is_empty!16327 () Bool)

(assert (=> b!854407 (= e!476411 tp_is_empty!16327)))

(declare-fun b!854408 () Bool)

(declare-fun res!580282 () Bool)

(assert (=> b!854408 (=> (not res!580282) (not e!476406))))

(declare-datatypes ((List!16639 0))(
  ( (Nil!16636) (Cons!16635 (h!17766 (_ BitVec 64)) (t!23267 List!16639)) )
))
(declare-fun arrayNoDuplicates!0 (array!48839 (_ BitVec 32) List!16639) Bool)

(assert (=> b!854408 (= res!580282 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16636))))

(declare-fun b!854409 () Bool)

(declare-fun res!580287 () Bool)

(assert (=> b!854409 (=> (not res!580287) (not e!476406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854409 (= res!580287 (validMask!0 mask!1196))))

(declare-fun b!854410 () Bool)

(declare-fun e!476405 () Bool)

(declare-fun e!476408 () Bool)

(assert (=> b!854410 (= e!476405 (not e!476408))))

(declare-fun res!580280 () Bool)

(assert (=> b!854410 (=> res!580280 e!476408)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854410 (= res!580280 (not (validKeyInArray!0 (select (arr!23451 _keys!868) from!1053))))))

(assert (=> b!854410 e!476410))

(declare-fun c!91892 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854410 (= c!91892 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26817)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26817)

(declare-fun zeroValue!654 () V!26817)

(declare-datatypes ((Unit!29103 0))(
  ( (Unit!29104) )
))
(declare-fun lt!385270 () Unit!29103)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!414 (array!48839 array!48837 (_ BitVec 32) (_ BitVec 32) V!26817 V!26817 (_ BitVec 32) (_ BitVec 64) V!26817 (_ BitVec 32) Int) Unit!29103)

(assert (=> b!854410 (= lt!385270 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!414 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854411 () Bool)

(declare-fun res!580283 () Bool)

(assert (=> b!854411 (=> (not res!580283) (not e!476406))))

(assert (=> b!854411 (= res!580283 (and (= (select (arr!23451 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854412 () Bool)

(assert (=> b!854412 (= e!476406 e!476405)))

(declare-fun res!580281 () Bool)

(assert (=> b!854412 (=> (not res!580281) (not e!476405))))

(assert (=> b!854412 (= res!580281 (= from!1053 i!612))))

(declare-fun lt!385276 () ListLongMap!9585)

(declare-fun lt!385272 () array!48837)

(declare-fun getCurrentListMapNoExtraKeys!2815 (array!48839 array!48837 (_ BitVec 32) (_ BitVec 32) V!26817 V!26817 (_ BitVec 32) Int) ListLongMap!9585)

(assert (=> b!854412 (= lt!385276 (getCurrentListMapNoExtraKeys!2815 _keys!868 lt!385272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854412 (= lt!385272 (array!48838 (store (arr!23450 _values!688) i!612 (ValueCellFull!7724 v!557)) (size!23892 _values!688)))))

(declare-fun lt!385271 () ListLongMap!9585)

(assert (=> b!854412 (= lt!385271 (getCurrentListMapNoExtraKeys!2815 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854413 () Bool)

(declare-fun res!580286 () Bool)

(assert (=> b!854413 (=> (not res!580286) (not e!476406))))

(assert (=> b!854413 (= res!580286 (validKeyInArray!0 k0!854))))

(declare-fun b!854414 () Bool)

(assert (=> b!854414 (= e!476407 tp_is_empty!16327)))

(declare-fun res!580279 () Bool)

(assert (=> start!73258 (=> (not res!580279) (not e!476406))))

(assert (=> start!73258 (= res!580279 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23893 _keys!868))))))

(assert (=> start!73258 e!476406))

(assert (=> start!73258 tp_is_empty!16327))

(assert (=> start!73258 true))

(assert (=> start!73258 tp!50078))

(declare-fun array_inv!18662 (array!48839) Bool)

(assert (=> start!73258 (array_inv!18662 _keys!868)))

(declare-fun e!476409 () Bool)

(declare-fun array_inv!18663 (array!48837) Bool)

(assert (=> start!73258 (and (array_inv!18663 _values!688) e!476409)))

(declare-fun bm!38399 () Bool)

(assert (=> bm!38399 (= call!38403 (getCurrentListMapNoExtraKeys!2815 _keys!868 lt!385272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854415 () Bool)

(assert (=> b!854415 (= e!476409 (and e!476411 mapRes!26090))))

(declare-fun condMapEmpty!26090 () Bool)

(declare-fun mapDefault!26090 () ValueCell!7724)

(assert (=> b!854415 (= condMapEmpty!26090 (= (arr!23450 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7724)) mapDefault!26090)))))

(declare-fun bm!38400 () Bool)

(assert (=> bm!38400 (= call!38402 (getCurrentListMapNoExtraKeys!2815 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854416 () Bool)

(declare-fun +!2216 (ListLongMap!9585 tuple2!10826) ListLongMap!9585)

(assert (=> b!854416 (= e!476410 (= call!38403 (+!2216 call!38402 (tuple2!10827 k0!854 v!557))))))

(declare-fun b!854417 () Bool)

(declare-fun res!580285 () Bool)

(assert (=> b!854417 (=> (not res!580285) (not e!476406))))

(assert (=> b!854417 (= res!580285 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23893 _keys!868))))))

(declare-fun b!854418 () Bool)

(assert (=> b!854418 (= e!476408 true)))

(declare-fun lt!385277 () V!26817)

(declare-fun lt!385275 () ListLongMap!9585)

(declare-fun lt!385269 () tuple2!10826)

(assert (=> b!854418 (= (+!2216 lt!385275 lt!385269) (+!2216 (+!2216 lt!385275 (tuple2!10827 k0!854 lt!385277)) lt!385269))))

(declare-fun lt!385274 () V!26817)

(assert (=> b!854418 (= lt!385269 (tuple2!10827 k0!854 lt!385274))))

(declare-fun lt!385268 () Unit!29103)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!322 (ListLongMap!9585 (_ BitVec 64) V!26817 V!26817) Unit!29103)

(assert (=> b!854418 (= lt!385268 (addSameAsAddTwiceSameKeyDiffValues!322 lt!385275 k0!854 lt!385277 lt!385274))))

(declare-fun lt!385273 () V!26817)

(declare-fun get!12383 (ValueCell!7724 V!26817) V!26817)

(assert (=> b!854418 (= lt!385277 (get!12383 (select (arr!23450 _values!688) from!1053) lt!385273))))

(assert (=> b!854418 (= lt!385276 (+!2216 lt!385275 (tuple2!10827 (select (arr!23451 _keys!868) from!1053) lt!385274)))))

(assert (=> b!854418 (= lt!385274 (get!12383 (select (store (arr!23450 _values!688) i!612 (ValueCellFull!7724 v!557)) from!1053) lt!385273))))

(declare-fun dynLambda!1072 (Int (_ BitVec 64)) V!26817)

(assert (=> b!854418 (= lt!385273 (dynLambda!1072 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854418 (= lt!385275 (getCurrentListMapNoExtraKeys!2815 _keys!868 lt!385272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73258 res!580279) b!854409))

(assert (= (and b!854409 res!580287) b!854404))

(assert (= (and b!854404 res!580278) b!854405))

(assert (= (and b!854405 res!580284) b!854408))

(assert (= (and b!854408 res!580282) b!854417))

(assert (= (and b!854417 res!580285) b!854413))

(assert (= (and b!854413 res!580286) b!854411))

(assert (= (and b!854411 res!580283) b!854412))

(assert (= (and b!854412 res!580281) b!854410))

(assert (= (and b!854410 c!91892) b!854416))

(assert (= (and b!854410 (not c!91892)) b!854406))

(assert (= (or b!854416 b!854406) bm!38399))

(assert (= (or b!854416 b!854406) bm!38400))

(assert (= (and b!854410 (not res!580280)) b!854418))

(assert (= (and b!854415 condMapEmpty!26090) mapIsEmpty!26090))

(assert (= (and b!854415 (not condMapEmpty!26090)) mapNonEmpty!26090))

(get-info :version)

(assert (= (and mapNonEmpty!26090 ((_ is ValueCellFull!7724) mapValue!26090)) b!854414))

(assert (= (and b!854415 ((_ is ValueCellFull!7724) mapDefault!26090)) b!854407))

(assert (= start!73258 b!854415))

(declare-fun b_lambda!11705 () Bool)

(assert (=> (not b_lambda!11705) (not b!854418)))

(declare-fun t!23265 () Bool)

(declare-fun tb!4485 () Bool)

(assert (=> (and start!73258 (= defaultEntry!696 defaultEntry!696) t!23265) tb!4485))

(declare-fun result!8589 () Bool)

(assert (=> tb!4485 (= result!8589 tp_is_empty!16327)))

(assert (=> b!854418 t!23265))

(declare-fun b_and!23517 () Bool)

(assert (= b_and!23515 (and (=> t!23265 result!8589) b_and!23517)))

(declare-fun m!795279 () Bool)

(assert (=> start!73258 m!795279))

(declare-fun m!795281 () Bool)

(assert (=> start!73258 m!795281))

(declare-fun m!795283 () Bool)

(assert (=> b!854413 m!795283))

(declare-fun m!795285 () Bool)

(assert (=> b!854409 m!795285))

(declare-fun m!795287 () Bool)

(assert (=> b!854412 m!795287))

(declare-fun m!795289 () Bool)

(assert (=> b!854412 m!795289))

(declare-fun m!795291 () Bool)

(assert (=> b!854412 m!795291))

(declare-fun m!795293 () Bool)

(assert (=> b!854410 m!795293))

(assert (=> b!854410 m!795293))

(declare-fun m!795295 () Bool)

(assert (=> b!854410 m!795295))

(declare-fun m!795297 () Bool)

(assert (=> b!854410 m!795297))

(declare-fun m!795299 () Bool)

(assert (=> bm!38399 m!795299))

(declare-fun m!795301 () Bool)

(assert (=> b!854416 m!795301))

(declare-fun m!795303 () Bool)

(assert (=> bm!38400 m!795303))

(declare-fun m!795305 () Bool)

(assert (=> b!854418 m!795305))

(declare-fun m!795307 () Bool)

(assert (=> b!854418 m!795307))

(declare-fun m!795309 () Bool)

(assert (=> b!854418 m!795309))

(assert (=> b!854418 m!795299))

(declare-fun m!795311 () Bool)

(assert (=> b!854418 m!795311))

(declare-fun m!795313 () Bool)

(assert (=> b!854418 m!795313))

(declare-fun m!795315 () Bool)

(assert (=> b!854418 m!795315))

(assert (=> b!854418 m!795313))

(assert (=> b!854418 m!795289))

(assert (=> b!854418 m!795305))

(declare-fun m!795317 () Bool)

(assert (=> b!854418 m!795317))

(assert (=> b!854418 m!795293))

(declare-fun m!795319 () Bool)

(assert (=> b!854418 m!795319))

(assert (=> b!854418 m!795317))

(declare-fun m!795321 () Bool)

(assert (=> b!854418 m!795321))

(declare-fun m!795323 () Bool)

(assert (=> b!854418 m!795323))

(declare-fun m!795325 () Bool)

(assert (=> b!854408 m!795325))

(declare-fun m!795327 () Bool)

(assert (=> b!854411 m!795327))

(declare-fun m!795329 () Bool)

(assert (=> b!854405 m!795329))

(declare-fun m!795331 () Bool)

(assert (=> mapNonEmpty!26090 m!795331))

(check-sat b_and!23517 (not b!854409) (not b!854413) (not b!854416) (not mapNonEmpty!26090) (not bm!38399) (not b!854405) (not bm!38400) (not b!854412) (not b_lambda!11705) (not start!73258) (not b!854418) (not b!854408) tp_is_empty!16327 (not b_next!14191) (not b!854410))
(check-sat b_and!23517 (not b_next!14191))
