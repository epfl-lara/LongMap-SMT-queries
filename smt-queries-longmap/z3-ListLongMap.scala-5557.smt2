; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73294 () Bool)

(assert start!73294)

(declare-fun b_free!14041 () Bool)

(declare-fun b_next!14041 () Bool)

(assert (=> start!73294 (= b_free!14041 (not b_next!14041))))

(declare-fun tp!49627 () Bool)

(declare-fun b_and!23251 () Bool)

(assert (=> start!73294 (= tp!49627 b_and!23251)))

(declare-fun b!852021 () Bool)

(declare-fun e!475335 () Bool)

(declare-fun e!475342 () Bool)

(assert (=> b!852021 (= e!475335 (not e!475342))))

(declare-fun res!578484 () Bool)

(assert (=> b!852021 (=> res!578484 e!475342)))

(declare-datatypes ((array!48607 0))(
  ( (array!48608 (arr!23330 (Array (_ BitVec 32) (_ BitVec 64))) (size!23771 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48607)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852021 (= res!578484 (not (validKeyInArray!0 (select (arr!23330 _keys!868) from!1053))))))

(declare-fun e!475339 () Bool)

(assert (=> b!852021 e!475339))

(declare-fun c!92014 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852021 (= c!92014 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29056 0))(
  ( (Unit!29057) )
))
(declare-fun lt!383620 () Unit!29056)

(declare-datatypes ((V!26617 0))(
  ( (V!26618 (val!8136 Int)) )
))
(declare-fun v!557 () V!26617)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26617)

(declare-fun zeroValue!654 () V!26617)

(declare-datatypes ((ValueCell!7649 0))(
  ( (ValueCellFull!7649 (v!10561 V!26617)) (EmptyCell!7649) )
))
(declare-datatypes ((array!48609 0))(
  ( (array!48610 (arr!23331 (Array (_ BitVec 32) ValueCell!7649)) (size!23772 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48609)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!361 (array!48607 array!48609 (_ BitVec 32) (_ BitVec 32) V!26617 V!26617 (_ BitVec 32) (_ BitVec 64) V!26617 (_ BitVec 32) Int) Unit!29056)

(assert (=> b!852021 (= lt!383620 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!361 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852022 () Bool)

(declare-fun e!475341 () Bool)

(declare-fun tp_is_empty!16177 () Bool)

(assert (=> b!852022 (= e!475341 tp_is_empty!16177)))

(declare-fun b!852023 () Bool)

(declare-datatypes ((tuple2!10596 0))(
  ( (tuple2!10597 (_1!5309 (_ BitVec 64)) (_2!5309 V!26617)) )
))
(declare-datatypes ((List!16455 0))(
  ( (Nil!16452) (Cons!16451 (h!17588 tuple2!10596) (t!22934 List!16455)) )
))
(declare-datatypes ((ListLongMap!9367 0))(
  ( (ListLongMap!9368 (toList!4699 List!16455)) )
))
(declare-fun call!38023 () ListLongMap!9367)

(declare-fun call!38024 () ListLongMap!9367)

(assert (=> b!852023 (= e!475339 (= call!38023 call!38024))))

(declare-fun b!852024 () Bool)

(declare-fun res!578490 () Bool)

(declare-fun e!475337 () Bool)

(assert (=> b!852024 (=> (not res!578490) (not e!475337))))

(declare-datatypes ((List!16456 0))(
  ( (Nil!16453) (Cons!16452 (h!17589 (_ BitVec 64)) (t!22935 List!16456)) )
))
(declare-fun arrayNoDuplicates!0 (array!48607 (_ BitVec 32) List!16456) Bool)

(assert (=> b!852024 (= res!578490 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16453))))

(declare-fun b!852025 () Bool)

(declare-fun res!578482 () Bool)

(assert (=> b!852025 (=> (not res!578482) (not e!475337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48607 (_ BitVec 32)) Bool)

(assert (=> b!852025 (= res!578482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852026 () Bool)

(declare-fun res!578491 () Bool)

(assert (=> b!852026 (=> (not res!578491) (not e!475337))))

(assert (=> b!852026 (= res!578491 (and (= (select (arr!23330 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852027 () Bool)

(assert (=> b!852027 (= e!475342 true)))

(declare-fun lt!383624 () tuple2!10596)

(declare-fun lt!383616 () V!26617)

(declare-fun lt!383622 () ListLongMap!9367)

(declare-fun +!2146 (ListLongMap!9367 tuple2!10596) ListLongMap!9367)

(assert (=> b!852027 (= (+!2146 lt!383622 lt!383624) (+!2146 (+!2146 lt!383622 (tuple2!10597 k0!854 lt!383616)) lt!383624))))

(declare-fun lt!383618 () V!26617)

(assert (=> b!852027 (= lt!383624 (tuple2!10597 k0!854 lt!383618))))

(declare-fun lt!383617 () Unit!29056)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!276 (ListLongMap!9367 (_ BitVec 64) V!26617 V!26617) Unit!29056)

(assert (=> b!852027 (= lt!383617 (addSameAsAddTwiceSameKeyDiffValues!276 lt!383622 k0!854 lt!383616 lt!383618))))

(declare-fun lt!383621 () V!26617)

(declare-fun get!12287 (ValueCell!7649 V!26617) V!26617)

(assert (=> b!852027 (= lt!383616 (get!12287 (select (arr!23331 _values!688) from!1053) lt!383621))))

(declare-fun lt!383623 () ListLongMap!9367)

(assert (=> b!852027 (= lt!383623 (+!2146 lt!383622 (tuple2!10597 (select (arr!23330 _keys!868) from!1053) lt!383618)))))

(assert (=> b!852027 (= lt!383618 (get!12287 (select (store (arr!23331 _values!688) i!612 (ValueCellFull!7649 v!557)) from!1053) lt!383621))))

(declare-fun dynLambda!1023 (Int (_ BitVec 64)) V!26617)

(assert (=> b!852027 (= lt!383621 (dynLambda!1023 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383619 () array!48609)

(declare-fun getCurrentListMapNoExtraKeys!2757 (array!48607 array!48609 (_ BitVec 32) (_ BitVec 32) V!26617 V!26617 (_ BitVec 32) Int) ListLongMap!9367)

(assert (=> b!852027 (= lt!383622 (getCurrentListMapNoExtraKeys!2757 _keys!868 lt!383619 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852028 () Bool)

(declare-fun res!578486 () Bool)

(assert (=> b!852028 (=> (not res!578486) (not e!475337))))

(assert (=> b!852028 (= res!578486 (validKeyInArray!0 k0!854))))

(declare-fun b!852029 () Bool)

(declare-fun e!475336 () Bool)

(assert (=> b!852029 (= e!475336 tp_is_empty!16177)))

(declare-fun b!852030 () Bool)

(declare-fun res!578488 () Bool)

(assert (=> b!852030 (=> (not res!578488) (not e!475337))))

(assert (=> b!852030 (= res!578488 (and (= (size!23772 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23771 _keys!868) (size!23772 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852031 () Bool)

(assert (=> b!852031 (= e!475337 e!475335)))

(declare-fun res!578489 () Bool)

(assert (=> b!852031 (=> (not res!578489) (not e!475335))))

(assert (=> b!852031 (= res!578489 (= from!1053 i!612))))

(assert (=> b!852031 (= lt!383623 (getCurrentListMapNoExtraKeys!2757 _keys!868 lt!383619 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852031 (= lt!383619 (array!48610 (store (arr!23331 _values!688) i!612 (ValueCellFull!7649 v!557)) (size!23772 _values!688)))))

(declare-fun lt!383615 () ListLongMap!9367)

(assert (=> b!852031 (= lt!383615 (getCurrentListMapNoExtraKeys!2757 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25865 () Bool)

(declare-fun mapRes!25865 () Bool)

(declare-fun tp!49628 () Bool)

(assert (=> mapNonEmpty!25865 (= mapRes!25865 (and tp!49628 e!475341))))

(declare-fun mapRest!25865 () (Array (_ BitVec 32) ValueCell!7649))

(declare-fun mapValue!25865 () ValueCell!7649)

(declare-fun mapKey!25865 () (_ BitVec 32))

(assert (=> mapNonEmpty!25865 (= (arr!23331 _values!688) (store mapRest!25865 mapKey!25865 mapValue!25865))))

(declare-fun bm!38020 () Bool)

(assert (=> bm!38020 (= call!38024 (getCurrentListMapNoExtraKeys!2757 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852032 () Bool)

(assert (=> b!852032 (= e!475339 (= call!38023 (+!2146 call!38024 (tuple2!10597 k0!854 v!557))))))

(declare-fun b!852033 () Bool)

(declare-fun e!475338 () Bool)

(assert (=> b!852033 (= e!475338 (and e!475336 mapRes!25865))))

(declare-fun condMapEmpty!25865 () Bool)

(declare-fun mapDefault!25865 () ValueCell!7649)

(assert (=> b!852033 (= condMapEmpty!25865 (= (arr!23331 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7649)) mapDefault!25865)))))

(declare-fun b!852034 () Bool)

(declare-fun res!578487 () Bool)

(assert (=> b!852034 (=> (not res!578487) (not e!475337))))

(assert (=> b!852034 (= res!578487 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23771 _keys!868))))))

(declare-fun mapIsEmpty!25865 () Bool)

(assert (=> mapIsEmpty!25865 mapRes!25865))

(declare-fun bm!38021 () Bool)

(assert (=> bm!38021 (= call!38023 (getCurrentListMapNoExtraKeys!2757 _keys!868 lt!383619 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578485 () Bool)

(assert (=> start!73294 (=> (not res!578485) (not e!475337))))

(assert (=> start!73294 (= res!578485 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23771 _keys!868))))))

(assert (=> start!73294 e!475337))

(assert (=> start!73294 tp_is_empty!16177))

(assert (=> start!73294 true))

(assert (=> start!73294 tp!49627))

(declare-fun array_inv!18558 (array!48607) Bool)

(assert (=> start!73294 (array_inv!18558 _keys!868)))

(declare-fun array_inv!18559 (array!48609) Bool)

(assert (=> start!73294 (and (array_inv!18559 _values!688) e!475338)))

(declare-fun b!852035 () Bool)

(declare-fun res!578483 () Bool)

(assert (=> b!852035 (=> (not res!578483) (not e!475337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852035 (= res!578483 (validMask!0 mask!1196))))

(assert (= (and start!73294 res!578485) b!852035))

(assert (= (and b!852035 res!578483) b!852030))

(assert (= (and b!852030 res!578488) b!852025))

(assert (= (and b!852025 res!578482) b!852024))

(assert (= (and b!852024 res!578490) b!852034))

(assert (= (and b!852034 res!578487) b!852028))

(assert (= (and b!852028 res!578486) b!852026))

(assert (= (and b!852026 res!578491) b!852031))

(assert (= (and b!852031 res!578489) b!852021))

(assert (= (and b!852021 c!92014) b!852032))

(assert (= (and b!852021 (not c!92014)) b!852023))

(assert (= (or b!852032 b!852023) bm!38020))

(assert (= (or b!852032 b!852023) bm!38021))

(assert (= (and b!852021 (not res!578484)) b!852027))

(assert (= (and b!852033 condMapEmpty!25865) mapIsEmpty!25865))

(assert (= (and b!852033 (not condMapEmpty!25865)) mapNonEmpty!25865))

(get-info :version)

(assert (= (and mapNonEmpty!25865 ((_ is ValueCellFull!7649) mapValue!25865)) b!852022))

(assert (= (and b!852033 ((_ is ValueCellFull!7649) mapDefault!25865)) b!852029))

(assert (= start!73294 b!852033))

(declare-fun b_lambda!11587 () Bool)

(assert (=> (not b_lambda!11587) (not b!852027)))

(declare-fun t!22933 () Bool)

(declare-fun tb!4335 () Bool)

(assert (=> (and start!73294 (= defaultEntry!696 defaultEntry!696) t!22933) tb!4335))

(declare-fun result!8289 () Bool)

(assert (=> tb!4335 (= result!8289 tp_is_empty!16177)))

(assert (=> b!852027 t!22933))

(declare-fun b_and!23253 () Bool)

(assert (= b_and!23251 (and (=> t!22933 result!8289) b_and!23253)))

(declare-fun m!793273 () Bool)

(assert (=> b!852021 m!793273))

(assert (=> b!852021 m!793273))

(declare-fun m!793275 () Bool)

(assert (=> b!852021 m!793275))

(declare-fun m!793277 () Bool)

(assert (=> b!852021 m!793277))

(declare-fun m!793279 () Bool)

(assert (=> b!852035 m!793279))

(declare-fun m!793281 () Bool)

(assert (=> bm!38020 m!793281))

(declare-fun m!793283 () Bool)

(assert (=> b!852031 m!793283))

(declare-fun m!793285 () Bool)

(assert (=> b!852031 m!793285))

(declare-fun m!793287 () Bool)

(assert (=> b!852031 m!793287))

(declare-fun m!793289 () Bool)

(assert (=> start!73294 m!793289))

(declare-fun m!793291 () Bool)

(assert (=> start!73294 m!793291))

(declare-fun m!793293 () Bool)

(assert (=> b!852026 m!793293))

(declare-fun m!793295 () Bool)

(assert (=> mapNonEmpty!25865 m!793295))

(declare-fun m!793297 () Bool)

(assert (=> b!852024 m!793297))

(declare-fun m!793299 () Bool)

(assert (=> bm!38021 m!793299))

(declare-fun m!793301 () Bool)

(assert (=> b!852032 m!793301))

(declare-fun m!793303 () Bool)

(assert (=> b!852025 m!793303))

(declare-fun m!793305 () Bool)

(assert (=> b!852028 m!793305))

(declare-fun m!793307 () Bool)

(assert (=> b!852027 m!793307))

(declare-fun m!793309 () Bool)

(assert (=> b!852027 m!793309))

(declare-fun m!793311 () Bool)

(assert (=> b!852027 m!793311))

(declare-fun m!793313 () Bool)

(assert (=> b!852027 m!793313))

(declare-fun m!793315 () Bool)

(assert (=> b!852027 m!793315))

(assert (=> b!852027 m!793299))

(assert (=> b!852027 m!793313))

(declare-fun m!793317 () Bool)

(assert (=> b!852027 m!793317))

(declare-fun m!793319 () Bool)

(assert (=> b!852027 m!793319))

(assert (=> b!852027 m!793307))

(declare-fun m!793321 () Bool)

(assert (=> b!852027 m!793321))

(assert (=> b!852027 m!793285))

(assert (=> b!852027 m!793273))

(declare-fun m!793323 () Bool)

(assert (=> b!852027 m!793323))

(declare-fun m!793325 () Bool)

(assert (=> b!852027 m!793325))

(assert (=> b!852027 m!793309))

(check-sat (not b!852025) (not b!852027) b_and!23253 (not b!852032) (not b_next!14041) (not b!852024) (not b!852031) (not mapNonEmpty!25865) (not b!852035) (not bm!38021) (not b!852028) (not b!852021) (not bm!38020) (not b_lambda!11587) (not start!73294) tp_is_empty!16177)
(check-sat b_and!23253 (not b_next!14041))
