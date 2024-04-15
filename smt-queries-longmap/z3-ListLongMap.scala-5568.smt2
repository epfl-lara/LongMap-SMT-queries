; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73174 () Bool)

(assert start!73174)

(declare-fun b_free!14107 () Bool)

(declare-fun b_next!14107 () Bool)

(assert (=> start!73174 (= b_free!14107 (not b_next!14107))))

(declare-fun tp!49826 () Bool)

(declare-fun b_and!23347 () Bool)

(assert (=> start!73174 (= tp!49826 b_and!23347)))

(declare-fun b!852430 () Bool)

(declare-fun res!579026 () Bool)

(declare-fun e!475402 () Bool)

(assert (=> b!852430 (=> (not res!579026) (not e!475402))))

(declare-datatypes ((array!48671 0))(
  ( (array!48672 (arr!23367 (Array (_ BitVec 32) (_ BitVec 64))) (size!23809 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48671)

(declare-datatypes ((List!16574 0))(
  ( (Nil!16571) (Cons!16570 (h!17701 (_ BitVec 64)) (t!23118 List!16574)) )
))
(declare-fun arrayNoDuplicates!0 (array!48671 (_ BitVec 32) List!16574) Bool)

(assert (=> b!852430 (= res!579026 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16571))))

(declare-fun e!475400 () Bool)

(declare-datatypes ((V!26705 0))(
  ( (V!26706 (val!8169 Int)) )
))
(declare-fun v!557 () V!26705)

(declare-datatypes ((tuple2!10748 0))(
  ( (tuple2!10749 (_1!5385 (_ BitVec 64)) (_2!5385 V!26705)) )
))
(declare-datatypes ((List!16575 0))(
  ( (Nil!16572) (Cons!16571 (h!17702 tuple2!10748) (t!23119 List!16575)) )
))
(declare-datatypes ((ListLongMap!9507 0))(
  ( (ListLongMap!9508 (toList!4769 List!16575)) )
))
(declare-fun call!38150 () ListLongMap!9507)

(declare-fun b!852431 () Bool)

(declare-fun call!38151 () ListLongMap!9507)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2184 (ListLongMap!9507 tuple2!10748) ListLongMap!9507)

(assert (=> b!852431 (= e!475400 (= call!38150 (+!2184 call!38151 (tuple2!10749 k0!854 v!557))))))

(declare-fun b!852432 () Bool)

(declare-fun e!475399 () Bool)

(declare-fun tp_is_empty!16243 () Bool)

(assert (=> b!852432 (= e!475399 tp_is_empty!16243)))

(declare-fun b!852433 () Bool)

(declare-fun e!475398 () Bool)

(assert (=> b!852433 (= e!475398 tp_is_empty!16243)))

(declare-fun b!852434 () Bool)

(declare-fun res!579025 () Bool)

(assert (=> b!852434 (=> (not res!579025) (not e!475402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852434 (= res!579025 (validKeyInArray!0 k0!854))))

(declare-fun b!852435 () Bool)

(declare-fun res!579019 () Bool)

(assert (=> b!852435 (=> (not res!579019) (not e!475402))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!852435 (= res!579019 (and (= (select (arr!23367 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852436 () Bool)

(declare-fun e!475401 () Bool)

(assert (=> b!852436 (= e!475402 e!475401)))

(declare-fun res!579027 () Bool)

(assert (=> b!852436 (=> (not res!579027) (not e!475401))))

(assert (=> b!852436 (= res!579027 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384010 () ListLongMap!9507)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26705)

(declare-fun zeroValue!654 () V!26705)

(declare-datatypes ((ValueCell!7682 0))(
  ( (ValueCellFull!7682 (v!10588 V!26705)) (EmptyCell!7682) )
))
(declare-datatypes ((array!48673 0))(
  ( (array!48674 (arr!23368 (Array (_ BitVec 32) ValueCell!7682)) (size!23810 (_ BitVec 32))) )
))
(declare-fun lt!384016 () array!48673)

(declare-fun getCurrentListMapNoExtraKeys!2777 (array!48671 array!48673 (_ BitVec 32) (_ BitVec 32) V!26705 V!26705 (_ BitVec 32) Int) ListLongMap!9507)

(assert (=> b!852436 (= lt!384010 (getCurrentListMapNoExtraKeys!2777 _keys!868 lt!384016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!48673)

(assert (=> b!852436 (= lt!384016 (array!48674 (store (arr!23368 _values!688) i!612 (ValueCellFull!7682 v!557)) (size!23810 _values!688)))))

(declare-fun lt!384014 () ListLongMap!9507)

(assert (=> b!852436 (= lt!384014 (getCurrentListMapNoExtraKeys!2777 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25964 () Bool)

(declare-fun mapRes!25964 () Bool)

(declare-fun tp!49825 () Bool)

(assert (=> mapNonEmpty!25964 (= mapRes!25964 (and tp!49825 e!475399))))

(declare-fun mapValue!25964 () ValueCell!7682)

(declare-fun mapKey!25964 () (_ BitVec 32))

(declare-fun mapRest!25964 () (Array (_ BitVec 32) ValueCell!7682))

(assert (=> mapNonEmpty!25964 (= (arr!23368 _values!688) (store mapRest!25964 mapKey!25964 mapValue!25964))))

(declare-fun b!852437 () Bool)

(declare-fun res!579024 () Bool)

(assert (=> b!852437 (=> (not res!579024) (not e!475402))))

(assert (=> b!852437 (= res!579024 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23809 _keys!868))))))

(declare-fun b!852438 () Bool)

(declare-fun res!579023 () Bool)

(assert (=> b!852438 (=> (not res!579023) (not e!475402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48671 (_ BitVec 32)) Bool)

(assert (=> b!852438 (= res!579023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852439 () Bool)

(declare-fun res!579021 () Bool)

(assert (=> b!852439 (=> (not res!579021) (not e!475402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852439 (= res!579021 (validMask!0 mask!1196))))

(declare-fun b!852440 () Bool)

(declare-fun res!579020 () Bool)

(assert (=> b!852440 (=> (not res!579020) (not e!475402))))

(assert (=> b!852440 (= res!579020 (and (= (size!23810 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23809 _keys!868) (size!23810 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852441 () Bool)

(declare-fun e!475397 () Bool)

(assert (=> b!852441 (= e!475397 true)))

(declare-fun lt!384017 () tuple2!10748)

(declare-fun lt!384012 () V!26705)

(declare-fun lt!384008 () ListLongMap!9507)

(assert (=> b!852441 (= (+!2184 lt!384008 lt!384017) (+!2184 (+!2184 lt!384008 (tuple2!10749 k0!854 lt!384012)) lt!384017))))

(declare-fun lt!384011 () V!26705)

(assert (=> b!852441 (= lt!384017 (tuple2!10749 k0!854 lt!384011))))

(declare-datatypes ((Unit!29039 0))(
  ( (Unit!29040) )
))
(declare-fun lt!384015 () Unit!29039)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!295 (ListLongMap!9507 (_ BitVec 64) V!26705 V!26705) Unit!29039)

(assert (=> b!852441 (= lt!384015 (addSameAsAddTwiceSameKeyDiffValues!295 lt!384008 k0!854 lt!384012 lt!384011))))

(declare-fun lt!384009 () V!26705)

(declare-fun get!12328 (ValueCell!7682 V!26705) V!26705)

(assert (=> b!852441 (= lt!384012 (get!12328 (select (arr!23368 _values!688) from!1053) lt!384009))))

(assert (=> b!852441 (= lt!384010 (+!2184 lt!384008 (tuple2!10749 (select (arr!23367 _keys!868) from!1053) lt!384011)))))

(assert (=> b!852441 (= lt!384011 (get!12328 (select (store (arr!23368 _values!688) i!612 (ValueCellFull!7682 v!557)) from!1053) lt!384009))))

(declare-fun dynLambda!1045 (Int (_ BitVec 64)) V!26705)

(assert (=> b!852441 (= lt!384009 (dynLambda!1045 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852441 (= lt!384008 (getCurrentListMapNoExtraKeys!2777 _keys!868 lt!384016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25964 () Bool)

(assert (=> mapIsEmpty!25964 mapRes!25964))

(declare-fun bm!38147 () Bool)

(assert (=> bm!38147 (= call!38151 (getCurrentListMapNoExtraKeys!2777 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852442 () Bool)

(assert (=> b!852442 (= e!475400 (= call!38150 call!38151))))

(declare-fun bm!38148 () Bool)

(assert (=> bm!38148 (= call!38150 (getCurrentListMapNoExtraKeys!2777 _keys!868 lt!384016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852443 () Bool)

(assert (=> b!852443 (= e!475401 (not e!475397))))

(declare-fun res!579022 () Bool)

(assert (=> b!852443 (=> res!579022 e!475397)))

(assert (=> b!852443 (= res!579022 (not (validKeyInArray!0 (select (arr!23367 _keys!868) from!1053))))))

(assert (=> b!852443 e!475400))

(declare-fun c!91766 () Bool)

(assert (=> b!852443 (= c!91766 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384013 () Unit!29039)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!387 (array!48671 array!48673 (_ BitVec 32) (_ BitVec 32) V!26705 V!26705 (_ BitVec 32) (_ BitVec 64) V!26705 (_ BitVec 32) Int) Unit!29039)

(assert (=> b!852443 (= lt!384013 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!387 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852444 () Bool)

(declare-fun e!475403 () Bool)

(assert (=> b!852444 (= e!475403 (and e!475398 mapRes!25964))))

(declare-fun condMapEmpty!25964 () Bool)

(declare-fun mapDefault!25964 () ValueCell!7682)

(assert (=> b!852444 (= condMapEmpty!25964 (= (arr!23368 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7682)) mapDefault!25964)))))

(declare-fun res!579018 () Bool)

(assert (=> start!73174 (=> (not res!579018) (not e!475402))))

(assert (=> start!73174 (= res!579018 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23809 _keys!868))))))

(assert (=> start!73174 e!475402))

(assert (=> start!73174 tp_is_empty!16243))

(assert (=> start!73174 true))

(assert (=> start!73174 tp!49826))

(declare-fun array_inv!18614 (array!48671) Bool)

(assert (=> start!73174 (array_inv!18614 _keys!868)))

(declare-fun array_inv!18615 (array!48673) Bool)

(assert (=> start!73174 (and (array_inv!18615 _values!688) e!475403)))

(assert (= (and start!73174 res!579018) b!852439))

(assert (= (and b!852439 res!579021) b!852440))

(assert (= (and b!852440 res!579020) b!852438))

(assert (= (and b!852438 res!579023) b!852430))

(assert (= (and b!852430 res!579026) b!852437))

(assert (= (and b!852437 res!579024) b!852434))

(assert (= (and b!852434 res!579025) b!852435))

(assert (= (and b!852435 res!579019) b!852436))

(assert (= (and b!852436 res!579027) b!852443))

(assert (= (and b!852443 c!91766) b!852431))

(assert (= (and b!852443 (not c!91766)) b!852442))

(assert (= (or b!852431 b!852442) bm!38148))

(assert (= (or b!852431 b!852442) bm!38147))

(assert (= (and b!852443 (not res!579022)) b!852441))

(assert (= (and b!852444 condMapEmpty!25964) mapIsEmpty!25964))

(assert (= (and b!852444 (not condMapEmpty!25964)) mapNonEmpty!25964))

(get-info :version)

(assert (= (and mapNonEmpty!25964 ((_ is ValueCellFull!7682) mapValue!25964)) b!852432))

(assert (= (and b!852444 ((_ is ValueCellFull!7682) mapDefault!25964)) b!852433))

(assert (= start!73174 b!852444))

(declare-fun b_lambda!11621 () Bool)

(assert (=> (not b_lambda!11621) (not b!852441)))

(declare-fun t!23117 () Bool)

(declare-fun tb!4401 () Bool)

(assert (=> (and start!73174 (= defaultEntry!696 defaultEntry!696) t!23117) tb!4401))

(declare-fun result!8421 () Bool)

(assert (=> tb!4401 (= result!8421 tp_is_empty!16243)))

(assert (=> b!852441 t!23117))

(declare-fun b_and!23349 () Bool)

(assert (= b_and!23347 (and (=> t!23117 result!8421) b_and!23349)))

(declare-fun m!793009 () Bool)

(assert (=> b!852438 m!793009))

(declare-fun m!793011 () Bool)

(assert (=> bm!38147 m!793011))

(declare-fun m!793013 () Bool)

(assert (=> b!852435 m!793013))

(declare-fun m!793015 () Bool)

(assert (=> b!852439 m!793015))

(declare-fun m!793017 () Bool)

(assert (=> mapNonEmpty!25964 m!793017))

(declare-fun m!793019 () Bool)

(assert (=> b!852436 m!793019))

(declare-fun m!793021 () Bool)

(assert (=> b!852436 m!793021))

(declare-fun m!793023 () Bool)

(assert (=> b!852436 m!793023))

(declare-fun m!793025 () Bool)

(assert (=> bm!38148 m!793025))

(declare-fun m!793027 () Bool)

(assert (=> b!852430 m!793027))

(declare-fun m!793029 () Bool)

(assert (=> b!852431 m!793029))

(assert (=> b!852441 m!793025))

(declare-fun m!793031 () Bool)

(assert (=> b!852441 m!793031))

(declare-fun m!793033 () Bool)

(assert (=> b!852441 m!793033))

(declare-fun m!793035 () Bool)

(assert (=> b!852441 m!793035))

(declare-fun m!793037 () Bool)

(assert (=> b!852441 m!793037))

(declare-fun m!793039 () Bool)

(assert (=> b!852441 m!793039))

(declare-fun m!793041 () Bool)

(assert (=> b!852441 m!793041))

(declare-fun m!793043 () Bool)

(assert (=> b!852441 m!793043))

(assert (=> b!852441 m!793037))

(declare-fun m!793045 () Bool)

(assert (=> b!852441 m!793045))

(declare-fun m!793047 () Bool)

(assert (=> b!852441 m!793047))

(assert (=> b!852441 m!793031))

(assert (=> b!852441 m!793039))

(assert (=> b!852441 m!793021))

(declare-fun m!793049 () Bool)

(assert (=> b!852441 m!793049))

(declare-fun m!793051 () Bool)

(assert (=> b!852441 m!793051))

(assert (=> b!852443 m!793049))

(assert (=> b!852443 m!793049))

(declare-fun m!793053 () Bool)

(assert (=> b!852443 m!793053))

(declare-fun m!793055 () Bool)

(assert (=> b!852443 m!793055))

(declare-fun m!793057 () Bool)

(assert (=> b!852434 m!793057))

(declare-fun m!793059 () Bool)

(assert (=> start!73174 m!793059))

(declare-fun m!793061 () Bool)

(assert (=> start!73174 m!793061))

(check-sat b_and!23349 (not b!852441) (not bm!38148) (not b!852430) (not b!852443) tp_is_empty!16243 (not bm!38147) (not start!73174) (not b_next!14107) (not b!852436) (not b!852438) (not mapNonEmpty!25964) (not b_lambda!11621) (not b!852431) (not b!852434) (not b!852439))
(check-sat b_and!23349 (not b_next!14107))
