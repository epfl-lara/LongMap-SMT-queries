; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73716 () Bool)

(assert start!73716)

(declare-fun b_free!14631 () Bool)

(declare-fun b_next!14631 () Bool)

(assert (=> start!73716 (= b_free!14631 (not b_next!14631))))

(declare-fun tp!51397 () Bool)

(declare-fun b_and!24241 () Bool)

(assert (=> start!73716 (= tp!51397 b_and!24241)))

(declare-fun b!864025 () Bool)

(declare-fun res!587114 () Bool)

(declare-fun e!481348 () Bool)

(assert (=> b!864025 (=> (not res!587114) (not e!481348))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49696 0))(
  ( (array!49697 (arr!23879 (Array (_ BitVec 32) (_ BitVec 64))) (size!24319 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49696)

(assert (=> b!864025 (= res!587114 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24319 _keys!868))))))

(declare-fun b!864026 () Bool)

(declare-fun e!481344 () Bool)

(declare-fun tp_is_empty!16767 () Bool)

(assert (=> b!864026 (= e!481344 tp_is_empty!16767)))

(declare-fun b!864028 () Bool)

(declare-fun e!481350 () Bool)

(declare-fun mapRes!26750 () Bool)

(assert (=> b!864028 (= e!481350 (and e!481344 mapRes!26750))))

(declare-fun condMapEmpty!26750 () Bool)

(declare-datatypes ((V!27403 0))(
  ( (V!27404 (val!8431 Int)) )
))
(declare-datatypes ((ValueCell!7944 0))(
  ( (ValueCellFull!7944 (v!10856 V!27403)) (EmptyCell!7944) )
))
(declare-datatypes ((array!49698 0))(
  ( (array!49699 (arr!23880 (Array (_ BitVec 32) ValueCell!7944)) (size!24320 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49698)

(declare-fun mapDefault!26750 () ValueCell!7944)

(assert (=> b!864028 (= condMapEmpty!26750 (= (arr!23880 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7944)) mapDefault!26750)))))

(declare-fun mapNonEmpty!26750 () Bool)

(declare-fun tp!51396 () Bool)

(declare-fun e!481351 () Bool)

(assert (=> mapNonEmpty!26750 (= mapRes!26750 (and tp!51396 e!481351))))

(declare-fun mapKey!26750 () (_ BitVec 32))

(declare-fun mapRest!26750 () (Array (_ BitVec 32) ValueCell!7944))

(declare-fun mapValue!26750 () ValueCell!7944)

(assert (=> mapNonEmpty!26750 (= (arr!23880 _values!688) (store mapRest!26750 mapKey!26750 mapValue!26750))))

(declare-fun b!864029 () Bool)

(assert (=> b!864029 (= e!481351 tp_is_empty!16767)))

(declare-fun mapIsEmpty!26750 () Bool)

(assert (=> mapIsEmpty!26750 mapRes!26750))

(declare-fun b!864030 () Bool)

(declare-fun res!587115 () Bool)

(assert (=> b!864030 (=> (not res!587115) (not e!481348))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864030 (= res!587115 (and (= (select (arr!23879 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864031 () Bool)

(declare-fun e!481346 () Bool)

(assert (=> b!864031 (= e!481346 true)))

(declare-datatypes ((tuple2!11164 0))(
  ( (tuple2!11165 (_1!5593 (_ BitVec 64)) (_2!5593 V!27403)) )
))
(declare-fun lt!390796 () tuple2!11164)

(declare-fun lt!390805 () tuple2!11164)

(declare-datatypes ((List!16969 0))(
  ( (Nil!16966) (Cons!16965 (h!18096 tuple2!11164) (t!23866 List!16969)) )
))
(declare-datatypes ((ListLongMap!9933 0))(
  ( (ListLongMap!9934 (toList!4982 List!16969)) )
))
(declare-fun lt!390803 () ListLongMap!9933)

(declare-fun lt!390799 () ListLongMap!9933)

(declare-fun +!2331 (ListLongMap!9933 tuple2!11164) ListLongMap!9933)

(assert (=> b!864031 (= lt!390799 (+!2331 (+!2331 lt!390803 lt!390805) lt!390796))))

(declare-datatypes ((Unit!29549 0))(
  ( (Unit!29550) )
))
(declare-fun lt!390795 () Unit!29549)

(declare-fun v!557 () V!27403)

(declare-fun lt!390794 () V!27403)

(declare-fun addCommutativeForDiffKeys!504 (ListLongMap!9933 (_ BitVec 64) V!27403 (_ BitVec 64) V!27403) Unit!29549)

(assert (=> b!864031 (= lt!390795 (addCommutativeForDiffKeys!504 lt!390803 k0!854 v!557 (select (arr!23879 _keys!868) from!1053) lt!390794))))

(declare-fun b!864032 () Bool)

(declare-fun res!587112 () Bool)

(assert (=> b!864032 (=> (not res!587112) (not e!481348))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49696 (_ BitVec 32)) Bool)

(assert (=> b!864032 (= res!587112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!587113 () Bool)

(assert (=> start!73716 (=> (not res!587113) (not e!481348))))

(assert (=> start!73716 (= res!587113 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24319 _keys!868))))))

(assert (=> start!73716 e!481348))

(assert (=> start!73716 tp_is_empty!16767))

(assert (=> start!73716 true))

(assert (=> start!73716 tp!51397))

(declare-fun array_inv!18886 (array!49696) Bool)

(assert (=> start!73716 (array_inv!18886 _keys!868)))

(declare-fun array_inv!18887 (array!49698) Bool)

(assert (=> start!73716 (and (array_inv!18887 _values!688) e!481350)))

(declare-fun b!864027 () Bool)

(declare-fun res!587118 () Bool)

(assert (=> b!864027 (=> (not res!587118) (not e!481348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864027 (= res!587118 (validKeyInArray!0 k0!854))))

(declare-fun b!864033 () Bool)

(declare-fun e!481347 () Bool)

(declare-fun e!481343 () Bool)

(assert (=> b!864033 (= e!481347 (not e!481343))))

(declare-fun res!587111 () Bool)

(assert (=> b!864033 (=> res!587111 e!481343)))

(assert (=> b!864033 (= res!587111 (not (validKeyInArray!0 (select (arr!23879 _keys!868) from!1053))))))

(declare-fun lt!390804 () ListLongMap!9933)

(declare-fun lt!390800 () ListLongMap!9933)

(assert (=> b!864033 (= lt!390804 lt!390800)))

(assert (=> b!864033 (= lt!390800 (+!2331 lt!390803 lt!390796))))

(declare-fun lt!390808 () array!49698)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27403)

(declare-fun zeroValue!654 () V!27403)

(declare-fun getCurrentListMapNoExtraKeys!2955 (array!49696 array!49698 (_ BitVec 32) (_ BitVec 32) V!27403 V!27403 (_ BitVec 32) Int) ListLongMap!9933)

(assert (=> b!864033 (= lt!390804 (getCurrentListMapNoExtraKeys!2955 _keys!868 lt!390808 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864033 (= lt!390796 (tuple2!11165 k0!854 v!557))))

(assert (=> b!864033 (= lt!390803 (getCurrentListMapNoExtraKeys!2955 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390793 () Unit!29549)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!535 (array!49696 array!49698 (_ BitVec 32) (_ BitVec 32) V!27403 V!27403 (_ BitVec 32) (_ BitVec 64) V!27403 (_ BitVec 32) Int) Unit!29549)

(assert (=> b!864033 (= lt!390793 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!535 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864034 () Bool)

(declare-fun res!587120 () Bool)

(assert (=> b!864034 (=> (not res!587120) (not e!481348))))

(declare-datatypes ((List!16970 0))(
  ( (Nil!16967) (Cons!16966 (h!18097 (_ BitVec 64)) (t!23867 List!16970)) )
))
(declare-fun arrayNoDuplicates!0 (array!49696 (_ BitVec 32) List!16970) Bool)

(assert (=> b!864034 (= res!587120 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16967))))

(declare-fun b!864035 () Bool)

(assert (=> b!864035 (= e!481343 e!481346)))

(declare-fun res!587110 () Bool)

(assert (=> b!864035 (=> res!587110 e!481346)))

(assert (=> b!864035 (= res!587110 (= k0!854 (select (arr!23879 _keys!868) from!1053)))))

(assert (=> b!864035 (not (= (select (arr!23879 _keys!868) from!1053) k0!854))))

(declare-fun lt!390802 () Unit!29549)

(declare-fun e!481349 () Unit!29549)

(assert (=> b!864035 (= lt!390802 e!481349)))

(declare-fun c!92167 () Bool)

(assert (=> b!864035 (= c!92167 (= (select (arr!23879 _keys!868) from!1053) k0!854))))

(declare-fun lt!390806 () ListLongMap!9933)

(assert (=> b!864035 (= lt!390806 lt!390799)))

(assert (=> b!864035 (= lt!390799 (+!2331 lt!390800 lt!390805))))

(assert (=> b!864035 (= lt!390805 (tuple2!11165 (select (arr!23879 _keys!868) from!1053) lt!390794))))

(declare-fun get!12611 (ValueCell!7944 V!27403) V!27403)

(declare-fun dynLambda!1157 (Int (_ BitVec 64)) V!27403)

(assert (=> b!864035 (= lt!390794 (get!12611 (select (arr!23880 _values!688) from!1053) (dynLambda!1157 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864036 () Bool)

(declare-fun res!587119 () Bool)

(assert (=> b!864036 (=> (not res!587119) (not e!481348))))

(assert (=> b!864036 (= res!587119 (and (= (size!24320 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24319 _keys!868) (size!24320 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864037 () Bool)

(declare-fun res!587117 () Bool)

(assert (=> b!864037 (=> (not res!587117) (not e!481348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864037 (= res!587117 (validMask!0 mask!1196))))

(declare-fun b!864038 () Bool)

(declare-fun Unit!29551 () Unit!29549)

(assert (=> b!864038 (= e!481349 Unit!29551)))

(declare-fun lt!390797 () Unit!29549)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49696 (_ BitVec 32) (_ BitVec 32)) Unit!29549)

(assert (=> b!864038 (= lt!390797 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864038 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16967)))

(declare-fun lt!390807 () Unit!29549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49696 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29549)

(assert (=> b!864038 (= lt!390807 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864038 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390798 () Unit!29549)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49696 (_ BitVec 64) (_ BitVec 32) List!16970) Unit!29549)

(assert (=> b!864038 (= lt!390798 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16967))))

(assert (=> b!864038 false))

(declare-fun b!864039 () Bool)

(assert (=> b!864039 (= e!481348 e!481347)))

(declare-fun res!587116 () Bool)

(assert (=> b!864039 (=> (not res!587116) (not e!481347))))

(assert (=> b!864039 (= res!587116 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864039 (= lt!390806 (getCurrentListMapNoExtraKeys!2955 _keys!868 lt!390808 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864039 (= lt!390808 (array!49699 (store (arr!23880 _values!688) i!612 (ValueCellFull!7944 v!557)) (size!24320 _values!688)))))

(declare-fun lt!390801 () ListLongMap!9933)

(assert (=> b!864039 (= lt!390801 (getCurrentListMapNoExtraKeys!2955 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864040 () Bool)

(declare-fun Unit!29552 () Unit!29549)

(assert (=> b!864040 (= e!481349 Unit!29552)))

(assert (= (and start!73716 res!587113) b!864037))

(assert (= (and b!864037 res!587117) b!864036))

(assert (= (and b!864036 res!587119) b!864032))

(assert (= (and b!864032 res!587112) b!864034))

(assert (= (and b!864034 res!587120) b!864025))

(assert (= (and b!864025 res!587114) b!864027))

(assert (= (and b!864027 res!587118) b!864030))

(assert (= (and b!864030 res!587115) b!864039))

(assert (= (and b!864039 res!587116) b!864033))

(assert (= (and b!864033 (not res!587111)) b!864035))

(assert (= (and b!864035 c!92167) b!864038))

(assert (= (and b!864035 (not c!92167)) b!864040))

(assert (= (and b!864035 (not res!587110)) b!864031))

(assert (= (and b!864028 condMapEmpty!26750) mapIsEmpty!26750))

(assert (= (and b!864028 (not condMapEmpty!26750)) mapNonEmpty!26750))

(get-info :version)

(assert (= (and mapNonEmpty!26750 ((_ is ValueCellFull!7944) mapValue!26750)) b!864029))

(assert (= (and b!864028 ((_ is ValueCellFull!7944) mapDefault!26750)) b!864026))

(assert (= start!73716 b!864028))

(declare-fun b_lambda!11983 () Bool)

(assert (=> (not b_lambda!11983) (not b!864035)))

(declare-fun t!23865 () Bool)

(declare-fun tb!4753 () Bool)

(assert (=> (and start!73716 (= defaultEntry!696 defaultEntry!696) t!23865) tb!4753))

(declare-fun result!9117 () Bool)

(assert (=> tb!4753 (= result!9117 tp_is_empty!16767)))

(assert (=> b!864035 t!23865))

(declare-fun b_and!24243 () Bool)

(assert (= b_and!24241 (and (=> t!23865 result!9117) b_and!24243)))

(declare-fun m!805299 () Bool)

(assert (=> b!864034 m!805299))

(declare-fun m!805301 () Bool)

(assert (=> b!864039 m!805301))

(declare-fun m!805303 () Bool)

(assert (=> b!864039 m!805303))

(declare-fun m!805305 () Bool)

(assert (=> b!864039 m!805305))

(declare-fun m!805307 () Bool)

(assert (=> b!864031 m!805307))

(assert (=> b!864031 m!805307))

(declare-fun m!805309 () Bool)

(assert (=> b!864031 m!805309))

(declare-fun m!805311 () Bool)

(assert (=> b!864031 m!805311))

(assert (=> b!864031 m!805311))

(declare-fun m!805313 () Bool)

(assert (=> b!864031 m!805313))

(declare-fun m!805315 () Bool)

(assert (=> start!73716 m!805315))

(declare-fun m!805317 () Bool)

(assert (=> start!73716 m!805317))

(declare-fun m!805319 () Bool)

(assert (=> b!864037 m!805319))

(declare-fun m!805321 () Bool)

(assert (=> b!864027 m!805321))

(declare-fun m!805323 () Bool)

(assert (=> b!864032 m!805323))

(declare-fun m!805325 () Bool)

(assert (=> b!864035 m!805325))

(declare-fun m!805327 () Bool)

(assert (=> b!864035 m!805327))

(declare-fun m!805329 () Bool)

(assert (=> b!864035 m!805329))

(declare-fun m!805331 () Bool)

(assert (=> b!864035 m!805331))

(assert (=> b!864035 m!805327))

(assert (=> b!864035 m!805311))

(assert (=> b!864035 m!805329))

(declare-fun m!805333 () Bool)

(assert (=> b!864030 m!805333))

(declare-fun m!805335 () Bool)

(assert (=> mapNonEmpty!26750 m!805335))

(declare-fun m!805337 () Bool)

(assert (=> b!864038 m!805337))

(declare-fun m!805339 () Bool)

(assert (=> b!864038 m!805339))

(declare-fun m!805341 () Bool)

(assert (=> b!864038 m!805341))

(declare-fun m!805343 () Bool)

(assert (=> b!864038 m!805343))

(declare-fun m!805345 () Bool)

(assert (=> b!864038 m!805345))

(declare-fun m!805347 () Bool)

(assert (=> b!864033 m!805347))

(assert (=> b!864033 m!805311))

(declare-fun m!805349 () Bool)

(assert (=> b!864033 m!805349))

(assert (=> b!864033 m!805311))

(declare-fun m!805351 () Bool)

(assert (=> b!864033 m!805351))

(declare-fun m!805353 () Bool)

(assert (=> b!864033 m!805353))

(declare-fun m!805355 () Bool)

(assert (=> b!864033 m!805355))

(check-sat tp_is_empty!16767 (not b!864034) (not b!864027) b_and!24243 (not b!864035) (not b_next!14631) (not b!864033) (not start!73716) (not b!864032) (not mapNonEmpty!26750) (not b!864037) (not b!864031) (not b_lambda!11983) (not b!864038) (not b!864039))
(check-sat b_and!24243 (not b_next!14631))
