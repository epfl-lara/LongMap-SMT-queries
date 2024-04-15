; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73690 () Bool)

(assert start!73690)

(declare-fun b_free!14623 () Bool)

(declare-fun b_next!14623 () Bool)

(assert (=> start!73690 (= b_free!14623 (not b_next!14623))))

(declare-fun tp!51373 () Bool)

(declare-fun b_and!24199 () Bool)

(assert (=> start!73690 (= tp!51373 b_and!24199)))

(declare-fun b!863586 () Bool)

(declare-fun e!481087 () Bool)

(declare-fun e!481090 () Bool)

(declare-fun mapRes!26738 () Bool)

(assert (=> b!863586 (= e!481087 (and e!481090 mapRes!26738))))

(declare-fun condMapEmpty!26738 () Bool)

(declare-datatypes ((V!27393 0))(
  ( (V!27394 (val!8427 Int)) )
))
(declare-datatypes ((ValueCell!7940 0))(
  ( (ValueCellFull!7940 (v!10846 V!27393)) (EmptyCell!7940) )
))
(declare-datatypes ((array!49671 0))(
  ( (array!49672 (arr!23867 (Array (_ BitVec 32) ValueCell!7940)) (size!24309 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49671)

(declare-fun mapDefault!26738 () ValueCell!7940)

(assert (=> b!863586 (= condMapEmpty!26738 (= (arr!23867 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7940)) mapDefault!26738)))))

(declare-fun b!863587 () Bool)

(declare-fun res!586872 () Bool)

(declare-fun e!481095 () Bool)

(assert (=> b!863587 (=> (not res!586872) (not e!481095))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49673 0))(
  ( (array!49674 (arr!23868 (Array (_ BitVec 32) (_ BitVec 64))) (size!24310 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49673)

(assert (=> b!863587 (= res!586872 (and (= (size!24309 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24310 _keys!868) (size!24309 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!586871 () Bool)

(assert (=> start!73690 (=> (not res!586871) (not e!481095))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73690 (= res!586871 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24310 _keys!868))))))

(assert (=> start!73690 e!481095))

(declare-fun tp_is_empty!16759 () Bool)

(assert (=> start!73690 tp_is_empty!16759))

(assert (=> start!73690 true))

(assert (=> start!73690 tp!51373))

(declare-fun array_inv!18948 (array!49673) Bool)

(assert (=> start!73690 (array_inv!18948 _keys!868)))

(declare-fun array_inv!18949 (array!49671) Bool)

(assert (=> start!73690 (and (array_inv!18949 _values!688) e!481087)))

(declare-fun b!863588 () Bool)

(declare-fun e!481092 () Bool)

(assert (=> b!863588 (= e!481092 true)))

(declare-datatypes ((tuple2!11168 0))(
  ( (tuple2!11169 (_1!5595 (_ BitVec 64)) (_2!5595 V!27393)) )
))
(declare-datatypes ((List!16962 0))(
  ( (Nil!16959) (Cons!16958 (h!18089 tuple2!11168) (t!23842 List!16962)) )
))
(declare-datatypes ((ListLongMap!9927 0))(
  ( (ListLongMap!9928 (toList!4979 List!16962)) )
))
(declare-fun lt!390374 () ListLongMap!9927)

(declare-fun lt!390368 () ListLongMap!9927)

(declare-fun lt!390380 () tuple2!11168)

(declare-fun lt!390367 () tuple2!11168)

(declare-fun +!2348 (ListLongMap!9927 tuple2!11168) ListLongMap!9927)

(assert (=> b!863588 (= lt!390374 (+!2348 (+!2348 lt!390368 lt!390380) lt!390367))))

(declare-fun v!557 () V!27393)

(declare-fun lt!390371 () V!27393)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29461 0))(
  ( (Unit!29462) )
))
(declare-fun lt!390379 () Unit!29461)

(declare-fun addCommutativeForDiffKeys!493 (ListLongMap!9927 (_ BitVec 64) V!27393 (_ BitVec 64) V!27393) Unit!29461)

(assert (=> b!863588 (= lt!390379 (addCommutativeForDiffKeys!493 lt!390368 k0!854 v!557 (select (arr!23868 _keys!868) from!1053) lt!390371))))

(declare-fun b!863589 () Bool)

(declare-fun res!586874 () Bool)

(assert (=> b!863589 (=> (not res!586874) (not e!481095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863589 (= res!586874 (validKeyInArray!0 k0!854))))

(declare-fun b!863590 () Bool)

(declare-fun res!586878 () Bool)

(assert (=> b!863590 (=> (not res!586878) (not e!481095))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863590 (= res!586878 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24310 _keys!868))))))

(declare-fun b!863591 () Bool)

(assert (=> b!863591 (= e!481090 tp_is_empty!16759)))

(declare-fun b!863592 () Bool)

(declare-fun res!586870 () Bool)

(assert (=> b!863592 (=> (not res!586870) (not e!481095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863592 (= res!586870 (validMask!0 mask!1196))))

(declare-fun b!863593 () Bool)

(declare-fun e!481093 () Bool)

(assert (=> b!863593 (= e!481093 e!481092)))

(declare-fun res!586875 () Bool)

(assert (=> b!863593 (=> res!586875 e!481092)))

(assert (=> b!863593 (= res!586875 (= k0!854 (select (arr!23868 _keys!868) from!1053)))))

(assert (=> b!863593 (not (= (select (arr!23868 _keys!868) from!1053) k0!854))))

(declare-fun lt!390375 () Unit!29461)

(declare-fun e!481089 () Unit!29461)

(assert (=> b!863593 (= lt!390375 e!481089)))

(declare-fun c!92090 () Bool)

(assert (=> b!863593 (= c!92090 (= (select (arr!23868 _keys!868) from!1053) k0!854))))

(declare-fun lt!390370 () ListLongMap!9927)

(assert (=> b!863593 (= lt!390370 lt!390374)))

(declare-fun lt!390369 () ListLongMap!9927)

(assert (=> b!863593 (= lt!390374 (+!2348 lt!390369 lt!390380))))

(assert (=> b!863593 (= lt!390380 (tuple2!11169 (select (arr!23868 _keys!868) from!1053) lt!390371))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12605 (ValueCell!7940 V!27393) V!27393)

(declare-fun dynLambda!1150 (Int (_ BitVec 64)) V!27393)

(assert (=> b!863593 (= lt!390371 (get!12605 (select (arr!23867 _values!688) from!1053) (dynLambda!1150 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863594 () Bool)

(declare-fun res!586873 () Bool)

(assert (=> b!863594 (=> (not res!586873) (not e!481095))))

(declare-datatypes ((List!16963 0))(
  ( (Nil!16960) (Cons!16959 (h!18090 (_ BitVec 64)) (t!23843 List!16963)) )
))
(declare-fun arrayNoDuplicates!0 (array!49673 (_ BitVec 32) List!16963) Bool)

(assert (=> b!863594 (= res!586873 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16960))))

(declare-fun b!863595 () Bool)

(declare-fun e!481094 () Bool)

(assert (=> b!863595 (= e!481095 e!481094)))

(declare-fun res!586868 () Bool)

(assert (=> b!863595 (=> (not res!586868) (not e!481094))))

(assert (=> b!863595 (= res!586868 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390372 () array!49671)

(declare-fun minValue!654 () V!27393)

(declare-fun zeroValue!654 () V!27393)

(declare-fun getCurrentListMapNoExtraKeys!2978 (array!49673 array!49671 (_ BitVec 32) (_ BitVec 32) V!27393 V!27393 (_ BitVec 32) Int) ListLongMap!9927)

(assert (=> b!863595 (= lt!390370 (getCurrentListMapNoExtraKeys!2978 _keys!868 lt!390372 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863595 (= lt!390372 (array!49672 (store (arr!23867 _values!688) i!612 (ValueCellFull!7940 v!557)) (size!24309 _values!688)))))

(declare-fun lt!390378 () ListLongMap!9927)

(assert (=> b!863595 (= lt!390378 (getCurrentListMapNoExtraKeys!2978 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26738 () Bool)

(assert (=> mapIsEmpty!26738 mapRes!26738))

(declare-fun mapNonEmpty!26738 () Bool)

(declare-fun tp!51374 () Bool)

(declare-fun e!481088 () Bool)

(assert (=> mapNonEmpty!26738 (= mapRes!26738 (and tp!51374 e!481088))))

(declare-fun mapValue!26738 () ValueCell!7940)

(declare-fun mapKey!26738 () (_ BitVec 32))

(declare-fun mapRest!26738 () (Array (_ BitVec 32) ValueCell!7940))

(assert (=> mapNonEmpty!26738 (= (arr!23867 _values!688) (store mapRest!26738 mapKey!26738 mapValue!26738))))

(declare-fun b!863596 () Bool)

(declare-fun res!586877 () Bool)

(assert (=> b!863596 (=> (not res!586877) (not e!481095))))

(assert (=> b!863596 (= res!586877 (and (= (select (arr!23868 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863597 () Bool)

(declare-fun res!586869 () Bool)

(assert (=> b!863597 (=> (not res!586869) (not e!481095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49673 (_ BitVec 32)) Bool)

(assert (=> b!863597 (= res!586869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863598 () Bool)

(assert (=> b!863598 (= e!481094 (not e!481093))))

(declare-fun res!586876 () Bool)

(assert (=> b!863598 (=> res!586876 e!481093)))

(assert (=> b!863598 (= res!586876 (not (validKeyInArray!0 (select (arr!23868 _keys!868) from!1053))))))

(declare-fun lt!390376 () ListLongMap!9927)

(assert (=> b!863598 (= lt!390376 lt!390369)))

(assert (=> b!863598 (= lt!390369 (+!2348 lt!390368 lt!390367))))

(assert (=> b!863598 (= lt!390376 (getCurrentListMapNoExtraKeys!2978 _keys!868 lt!390372 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863598 (= lt!390367 (tuple2!11169 k0!854 v!557))))

(assert (=> b!863598 (= lt!390368 (getCurrentListMapNoExtraKeys!2978 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390373 () Unit!29461)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!529 (array!49673 array!49671 (_ BitVec 32) (_ BitVec 32) V!27393 V!27393 (_ BitVec 32) (_ BitVec 64) V!27393 (_ BitVec 32) Int) Unit!29461)

(assert (=> b!863598 (= lt!390373 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!529 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863599 () Bool)

(declare-fun Unit!29463 () Unit!29461)

(assert (=> b!863599 (= e!481089 Unit!29463)))

(declare-fun lt!390366 () Unit!29461)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49673 (_ BitVec 32) (_ BitVec 32)) Unit!29461)

(assert (=> b!863599 (= lt!390366 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863599 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16960)))

(declare-fun lt!390377 () Unit!29461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49673 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29461)

(assert (=> b!863599 (= lt!390377 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863599 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390365 () Unit!29461)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49673 (_ BitVec 64) (_ BitVec 32) List!16963) Unit!29461)

(assert (=> b!863599 (= lt!390365 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16960))))

(assert (=> b!863599 false))

(declare-fun b!863600 () Bool)

(declare-fun Unit!29464 () Unit!29461)

(assert (=> b!863600 (= e!481089 Unit!29464)))

(declare-fun b!863601 () Bool)

(assert (=> b!863601 (= e!481088 tp_is_empty!16759)))

(assert (= (and start!73690 res!586871) b!863592))

(assert (= (and b!863592 res!586870) b!863587))

(assert (= (and b!863587 res!586872) b!863597))

(assert (= (and b!863597 res!586869) b!863594))

(assert (= (and b!863594 res!586873) b!863590))

(assert (= (and b!863590 res!586878) b!863589))

(assert (= (and b!863589 res!586874) b!863596))

(assert (= (and b!863596 res!586877) b!863595))

(assert (= (and b!863595 res!586868) b!863598))

(assert (= (and b!863598 (not res!586876)) b!863593))

(assert (= (and b!863593 c!92090) b!863599))

(assert (= (and b!863593 (not c!92090)) b!863600))

(assert (= (and b!863593 (not res!586875)) b!863588))

(assert (= (and b!863586 condMapEmpty!26738) mapIsEmpty!26738))

(assert (= (and b!863586 (not condMapEmpty!26738)) mapNonEmpty!26738))

(get-info :version)

(assert (= (and mapNonEmpty!26738 ((_ is ValueCellFull!7940) mapValue!26738)) b!863601))

(assert (= (and b!863586 ((_ is ValueCellFull!7940) mapDefault!26738)) b!863591))

(assert (= start!73690 b!863586))

(declare-fun b_lambda!11957 () Bool)

(assert (=> (not b_lambda!11957) (not b!863593)))

(declare-fun t!23841 () Bool)

(declare-fun tb!4737 () Bool)

(assert (=> (and start!73690 (= defaultEntry!696 defaultEntry!696) t!23841) tb!4737))

(declare-fun result!9093 () Bool)

(assert (=> tb!4737 (= result!9093 tp_is_empty!16759)))

(assert (=> b!863593 t!23841))

(declare-fun b_and!24201 () Bool)

(assert (= b_and!24199 (and (=> t!23841 result!9093) b_and!24201)))

(declare-fun m!804309 () Bool)

(assert (=> b!863597 m!804309))

(declare-fun m!804311 () Bool)

(assert (=> start!73690 m!804311))

(declare-fun m!804313 () Bool)

(assert (=> start!73690 m!804313))

(declare-fun m!804315 () Bool)

(assert (=> b!863592 m!804315))

(declare-fun m!804317 () Bool)

(assert (=> b!863596 m!804317))

(declare-fun m!804319 () Bool)

(assert (=> b!863593 m!804319))

(declare-fun m!804321 () Bool)

(assert (=> b!863593 m!804321))

(declare-fun m!804323 () Bool)

(assert (=> b!863593 m!804323))

(declare-fun m!804325 () Bool)

(assert (=> b!863593 m!804325))

(assert (=> b!863593 m!804321))

(declare-fun m!804327 () Bool)

(assert (=> b!863593 m!804327))

(assert (=> b!863593 m!804323))

(declare-fun m!804329 () Bool)

(assert (=> b!863595 m!804329))

(declare-fun m!804331 () Bool)

(assert (=> b!863595 m!804331))

(declare-fun m!804333 () Bool)

(assert (=> b!863595 m!804333))

(declare-fun m!804335 () Bool)

(assert (=> b!863594 m!804335))

(declare-fun m!804337 () Bool)

(assert (=> b!863589 m!804337))

(declare-fun m!804339 () Bool)

(assert (=> mapNonEmpty!26738 m!804339))

(declare-fun m!804341 () Bool)

(assert (=> b!863599 m!804341))

(declare-fun m!804343 () Bool)

(assert (=> b!863599 m!804343))

(declare-fun m!804345 () Bool)

(assert (=> b!863599 m!804345))

(declare-fun m!804347 () Bool)

(assert (=> b!863599 m!804347))

(declare-fun m!804349 () Bool)

(assert (=> b!863599 m!804349))

(declare-fun m!804351 () Bool)

(assert (=> b!863588 m!804351))

(assert (=> b!863588 m!804351))

(declare-fun m!804353 () Bool)

(assert (=> b!863588 m!804353))

(assert (=> b!863588 m!804327))

(assert (=> b!863588 m!804327))

(declare-fun m!804355 () Bool)

(assert (=> b!863588 m!804355))

(declare-fun m!804357 () Bool)

(assert (=> b!863598 m!804357))

(declare-fun m!804359 () Bool)

(assert (=> b!863598 m!804359))

(declare-fun m!804361 () Bool)

(assert (=> b!863598 m!804361))

(assert (=> b!863598 m!804327))

(declare-fun m!804363 () Bool)

(assert (=> b!863598 m!804363))

(assert (=> b!863598 m!804327))

(declare-fun m!804365 () Bool)

(assert (=> b!863598 m!804365))

(check-sat (not b_lambda!11957) (not b!863593) (not b!863597) (not b!863594) (not b!863598) (not b!863595) (not b!863588) (not start!73690) tp_is_empty!16759 (not b_next!14623) (not b!863592) (not mapNonEmpty!26738) (not b!863599) b_and!24201 (not b!863589))
(check-sat b_and!24201 (not b_next!14623))
