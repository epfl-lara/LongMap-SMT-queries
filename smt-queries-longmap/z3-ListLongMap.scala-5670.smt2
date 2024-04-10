; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73806 () Bool)

(assert start!73806)

(declare-fun b_free!14721 () Bool)

(declare-fun b_next!14721 () Bool)

(assert (=> start!73806 (= b_free!14721 (not b_next!14721))))

(declare-fun tp!51667 () Bool)

(declare-fun b_and!24421 () Bool)

(assert (=> start!73806 (= tp!51667 b_and!24421)))

(declare-fun b!866275 () Bool)

(declare-fun res!588596 () Bool)

(declare-fun e!482560 () Bool)

(assert (=> b!866275 (=> (not res!588596) (not e!482560))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866275 (= res!588596 (validKeyInArray!0 k0!854))))

(declare-fun b!866276 () Bool)

(declare-fun res!588599 () Bool)

(assert (=> b!866276 (=> (not res!588599) (not e!482560))))

(declare-datatypes ((array!49874 0))(
  ( (array!49875 (arr!23968 (Array (_ BitVec 32) (_ BitVec 64))) (size!24408 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49874)

(declare-datatypes ((List!17039 0))(
  ( (Nil!17036) (Cons!17035 (h!18166 (_ BitVec 64)) (t!24026 List!17039)) )
))
(declare-fun arrayNoDuplicates!0 (array!49874 (_ BitVec 32) List!17039) Bool)

(assert (=> b!866276 (= res!588599 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17036))))

(declare-fun b!866277 () Bool)

(declare-fun res!588598 () Bool)

(assert (=> b!866277 (=> (not res!588598) (not e!482560))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27523 0))(
  ( (V!27524 (val!8476 Int)) )
))
(declare-datatypes ((ValueCell!7989 0))(
  ( (ValueCellFull!7989 (v!10901 V!27523)) (EmptyCell!7989) )
))
(declare-datatypes ((array!49876 0))(
  ( (array!49877 (arr!23969 (Array (_ BitVec 32) ValueCell!7989)) (size!24409 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49876)

(assert (=> b!866277 (= res!588598 (and (= (size!24409 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24408 _keys!868) (size!24409 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866278 () Bool)

(declare-fun e!482565 () Bool)

(declare-fun e!482561 () Bool)

(assert (=> b!866278 (= e!482565 (not e!482561))))

(declare-fun res!588605 () Bool)

(assert (=> b!866278 (=> res!588605 e!482561)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866278 (= res!588605 (not (validKeyInArray!0 (select (arr!23968 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11238 0))(
  ( (tuple2!11239 (_1!5630 (_ BitVec 64)) (_2!5630 V!27523)) )
))
(declare-datatypes ((List!17040 0))(
  ( (Nil!17037) (Cons!17036 (h!18167 tuple2!11238) (t!24027 List!17040)) )
))
(declare-datatypes ((ListLongMap!10007 0))(
  ( (ListLongMap!10008 (toList!5019 List!17040)) )
))
(declare-fun lt!392968 () ListLongMap!10007)

(declare-fun lt!392957 () ListLongMap!10007)

(assert (=> b!866278 (= lt!392968 lt!392957)))

(declare-fun lt!392954 () ListLongMap!10007)

(declare-fun lt!392958 () tuple2!11238)

(declare-fun +!2366 (ListLongMap!10007 tuple2!11238) ListLongMap!10007)

(assert (=> b!866278 (= lt!392957 (+!2366 lt!392954 lt!392958))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!392966 () array!49876)

(declare-fun minValue!654 () V!27523)

(declare-fun zeroValue!654 () V!27523)

(declare-fun getCurrentListMapNoExtraKeys!2990 (array!49874 array!49876 (_ BitVec 32) (_ BitVec 32) V!27523 V!27523 (_ BitVec 32) Int) ListLongMap!10007)

(assert (=> b!866278 (= lt!392968 (getCurrentListMapNoExtraKeys!2990 _keys!868 lt!392966 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27523)

(assert (=> b!866278 (= lt!392958 (tuple2!11239 k0!854 v!557))))

(assert (=> b!866278 (= lt!392954 (getCurrentListMapNoExtraKeys!2990 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29687 0))(
  ( (Unit!29688) )
))
(declare-fun lt!392961 () Unit!29687)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!565 (array!49874 array!49876 (_ BitVec 32) (_ BitVec 32) V!27523 V!27523 (_ BitVec 32) (_ BitVec 64) V!27523 (_ BitVec 32) Int) Unit!29687)

(assert (=> b!866278 (= lt!392961 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!565 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866279 () Bool)

(declare-fun e!482564 () Unit!29687)

(declare-fun Unit!29689 () Unit!29687)

(assert (=> b!866279 (= e!482564 Unit!29689)))

(declare-fun lt!392960 () Unit!29687)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49874 (_ BitVec 32) (_ BitVec 32)) Unit!29687)

(assert (=> b!866279 (= lt!392960 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866279 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17036)))

(declare-fun lt!392953 () Unit!29687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49874 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29687)

(assert (=> b!866279 (= lt!392953 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866279 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392955 () Unit!29687)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49874 (_ BitVec 64) (_ BitVec 32) List!17039) Unit!29687)

(assert (=> b!866279 (= lt!392955 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17036))))

(assert (=> b!866279 false))

(declare-fun b!866280 () Bool)

(declare-fun res!588603 () Bool)

(assert (=> b!866280 (=> (not res!588603) (not e!482560))))

(assert (=> b!866280 (= res!588603 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24408 _keys!868))))))

(declare-fun b!866281 () Bool)

(declare-fun e!482558 () Bool)

(assert (=> b!866281 (= e!482558 true)))

(declare-fun lt!392963 () ListLongMap!10007)

(declare-fun lt!392959 () tuple2!11238)

(assert (=> b!866281 (= lt!392963 (+!2366 (+!2366 lt!392954 lt!392959) lt!392958))))

(declare-fun lt!392964 () V!27523)

(declare-fun lt!392956 () Unit!29687)

(declare-fun addCommutativeForDiffKeys!534 (ListLongMap!10007 (_ BitVec 64) V!27523 (_ BitVec 64) V!27523) Unit!29687)

(assert (=> b!866281 (= lt!392956 (addCommutativeForDiffKeys!534 lt!392954 k0!854 v!557 (select (arr!23968 _keys!868) from!1053) lt!392964))))

(declare-fun b!866283 () Bool)

(declare-fun e!482562 () Bool)

(declare-fun e!482566 () Bool)

(declare-fun mapRes!26885 () Bool)

(assert (=> b!866283 (= e!482562 (and e!482566 mapRes!26885))))

(declare-fun condMapEmpty!26885 () Bool)

(declare-fun mapDefault!26885 () ValueCell!7989)

(assert (=> b!866283 (= condMapEmpty!26885 (= (arr!23969 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7989)) mapDefault!26885)))))

(declare-fun b!866284 () Bool)

(declare-fun res!588601 () Bool)

(assert (=> b!866284 (=> (not res!588601) (not e!482560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866284 (= res!588601 (validMask!0 mask!1196))))

(declare-fun b!866285 () Bool)

(assert (=> b!866285 (= e!482561 e!482558)))

(declare-fun res!588595 () Bool)

(assert (=> b!866285 (=> res!588595 e!482558)))

(assert (=> b!866285 (= res!588595 (= k0!854 (select (arr!23968 _keys!868) from!1053)))))

(assert (=> b!866285 (not (= (select (arr!23968 _keys!868) from!1053) k0!854))))

(declare-fun lt!392967 () Unit!29687)

(assert (=> b!866285 (= lt!392967 e!482564)))

(declare-fun c!92302 () Bool)

(assert (=> b!866285 (= c!92302 (= (select (arr!23968 _keys!868) from!1053) k0!854))))

(declare-fun lt!392965 () ListLongMap!10007)

(assert (=> b!866285 (= lt!392965 lt!392963)))

(assert (=> b!866285 (= lt!392963 (+!2366 lt!392957 lt!392959))))

(assert (=> b!866285 (= lt!392959 (tuple2!11239 (select (arr!23968 _keys!868) from!1053) lt!392964))))

(declare-fun get!12670 (ValueCell!7989 V!27523) V!27523)

(declare-fun dynLambda!1186 (Int (_ BitVec 64)) V!27523)

(assert (=> b!866285 (= lt!392964 (get!12670 (select (arr!23969 _values!688) from!1053) (dynLambda!1186 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26885 () Bool)

(declare-fun tp!51666 () Bool)

(declare-fun e!482563 () Bool)

(assert (=> mapNonEmpty!26885 (= mapRes!26885 (and tp!51666 e!482563))))

(declare-fun mapValue!26885 () ValueCell!7989)

(declare-fun mapKey!26885 () (_ BitVec 32))

(declare-fun mapRest!26885 () (Array (_ BitVec 32) ValueCell!7989))

(assert (=> mapNonEmpty!26885 (= (arr!23969 _values!688) (store mapRest!26885 mapKey!26885 mapValue!26885))))

(declare-fun b!866286 () Bool)

(declare-fun res!588600 () Bool)

(assert (=> b!866286 (=> (not res!588600) (not e!482560))))

(assert (=> b!866286 (= res!588600 (and (= (select (arr!23968 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26885 () Bool)

(assert (=> mapIsEmpty!26885 mapRes!26885))

(declare-fun b!866287 () Bool)

(declare-fun tp_is_empty!16857 () Bool)

(assert (=> b!866287 (= e!482566 tp_is_empty!16857)))

(declare-fun b!866288 () Bool)

(assert (=> b!866288 (= e!482560 e!482565)))

(declare-fun res!588597 () Bool)

(assert (=> b!866288 (=> (not res!588597) (not e!482565))))

(assert (=> b!866288 (= res!588597 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866288 (= lt!392965 (getCurrentListMapNoExtraKeys!2990 _keys!868 lt!392966 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866288 (= lt!392966 (array!49877 (store (arr!23969 _values!688) i!612 (ValueCellFull!7989 v!557)) (size!24409 _values!688)))))

(declare-fun lt!392962 () ListLongMap!10007)

(assert (=> b!866288 (= lt!392962 (getCurrentListMapNoExtraKeys!2990 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866282 () Bool)

(declare-fun res!588602 () Bool)

(assert (=> b!866282 (=> (not res!588602) (not e!482560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49874 (_ BitVec 32)) Bool)

(assert (=> b!866282 (= res!588602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!588604 () Bool)

(assert (=> start!73806 (=> (not res!588604) (not e!482560))))

(assert (=> start!73806 (= res!588604 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24408 _keys!868))))))

(assert (=> start!73806 e!482560))

(assert (=> start!73806 tp_is_empty!16857))

(assert (=> start!73806 true))

(assert (=> start!73806 tp!51667))

(declare-fun array_inv!18942 (array!49874) Bool)

(assert (=> start!73806 (array_inv!18942 _keys!868)))

(declare-fun array_inv!18943 (array!49876) Bool)

(assert (=> start!73806 (and (array_inv!18943 _values!688) e!482562)))

(declare-fun b!866289 () Bool)

(assert (=> b!866289 (= e!482563 tp_is_empty!16857)))

(declare-fun b!866290 () Bool)

(declare-fun Unit!29690 () Unit!29687)

(assert (=> b!866290 (= e!482564 Unit!29690)))

(assert (= (and start!73806 res!588604) b!866284))

(assert (= (and b!866284 res!588601) b!866277))

(assert (= (and b!866277 res!588598) b!866282))

(assert (= (and b!866282 res!588602) b!866276))

(assert (= (and b!866276 res!588599) b!866280))

(assert (= (and b!866280 res!588603) b!866275))

(assert (= (and b!866275 res!588596) b!866286))

(assert (= (and b!866286 res!588600) b!866288))

(assert (= (and b!866288 res!588597) b!866278))

(assert (= (and b!866278 (not res!588605)) b!866285))

(assert (= (and b!866285 c!92302) b!866279))

(assert (= (and b!866285 (not c!92302)) b!866290))

(assert (= (and b!866285 (not res!588595)) b!866281))

(assert (= (and b!866283 condMapEmpty!26885) mapIsEmpty!26885))

(assert (= (and b!866283 (not condMapEmpty!26885)) mapNonEmpty!26885))

(get-info :version)

(assert (= (and mapNonEmpty!26885 ((_ is ValueCellFull!7989) mapValue!26885)) b!866289))

(assert (= (and b!866283 ((_ is ValueCellFull!7989) mapDefault!26885)) b!866287))

(assert (= start!73806 b!866283))

(declare-fun b_lambda!12073 () Bool)

(assert (=> (not b_lambda!12073) (not b!866285)))

(declare-fun t!24025 () Bool)

(declare-fun tb!4843 () Bool)

(assert (=> (and start!73806 (= defaultEntry!696 defaultEntry!696) t!24025) tb!4843))

(declare-fun result!9297 () Bool)

(assert (=> tb!4843 (= result!9297 tp_is_empty!16857)))

(assert (=> b!866285 t!24025))

(declare-fun b_and!24423 () Bool)

(assert (= b_and!24421 (and (=> t!24025 result!9297) b_and!24423)))

(declare-fun m!807909 () Bool)

(assert (=> b!866282 m!807909))

(declare-fun m!807911 () Bool)

(assert (=> start!73806 m!807911))

(declare-fun m!807913 () Bool)

(assert (=> start!73806 m!807913))

(declare-fun m!807915 () Bool)

(assert (=> b!866281 m!807915))

(assert (=> b!866281 m!807915))

(declare-fun m!807917 () Bool)

(assert (=> b!866281 m!807917))

(declare-fun m!807919 () Bool)

(assert (=> b!866281 m!807919))

(assert (=> b!866281 m!807919))

(declare-fun m!807921 () Bool)

(assert (=> b!866281 m!807921))

(declare-fun m!807923 () Bool)

(assert (=> b!866284 m!807923))

(declare-fun m!807925 () Bool)

(assert (=> b!866276 m!807925))

(declare-fun m!807927 () Bool)

(assert (=> b!866286 m!807927))

(declare-fun m!807929 () Bool)

(assert (=> b!866285 m!807929))

(declare-fun m!807931 () Bool)

(assert (=> b!866285 m!807931))

(declare-fun m!807933 () Bool)

(assert (=> b!866285 m!807933))

(declare-fun m!807935 () Bool)

(assert (=> b!866285 m!807935))

(assert (=> b!866285 m!807931))

(assert (=> b!866285 m!807919))

(assert (=> b!866285 m!807933))

(declare-fun m!807937 () Bool)

(assert (=> b!866275 m!807937))

(declare-fun m!807939 () Bool)

(assert (=> b!866279 m!807939))

(declare-fun m!807941 () Bool)

(assert (=> b!866279 m!807941))

(declare-fun m!807943 () Bool)

(assert (=> b!866279 m!807943))

(declare-fun m!807945 () Bool)

(assert (=> b!866279 m!807945))

(declare-fun m!807947 () Bool)

(assert (=> b!866279 m!807947))

(declare-fun m!807949 () Bool)

(assert (=> mapNonEmpty!26885 m!807949))

(declare-fun m!807951 () Bool)

(assert (=> b!866278 m!807951))

(assert (=> b!866278 m!807919))

(declare-fun m!807953 () Bool)

(assert (=> b!866278 m!807953))

(declare-fun m!807955 () Bool)

(assert (=> b!866278 m!807955))

(declare-fun m!807957 () Bool)

(assert (=> b!866278 m!807957))

(assert (=> b!866278 m!807919))

(declare-fun m!807959 () Bool)

(assert (=> b!866278 m!807959))

(declare-fun m!807961 () Bool)

(assert (=> b!866288 m!807961))

(declare-fun m!807963 () Bool)

(assert (=> b!866288 m!807963))

(declare-fun m!807965 () Bool)

(assert (=> b!866288 m!807965))

(check-sat (not b!866288) tp_is_empty!16857 (not b!866279) (not start!73806) (not b!866275) (not mapNonEmpty!26885) (not b_lambda!12073) (not b!866282) (not b!866285) (not b!866276) (not b!866284) (not b!866278) (not b_next!14721) b_and!24423 (not b!866281))
(check-sat b_and!24423 (not b_next!14721))
