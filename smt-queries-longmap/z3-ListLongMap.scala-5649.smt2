; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73846 () Bool)

(assert start!73846)

(declare-fun b_free!14593 () Bool)

(declare-fun b_next!14593 () Bool)

(assert (=> start!73846 (= b_free!14593 (not b_next!14593))))

(declare-fun tp!51284 () Bool)

(declare-fun b_and!24175 () Bool)

(assert (=> start!73846 (= tp!51284 b_and!24175)))

(declare-fun res!586832 () Bool)

(declare-fun e!481418 () Bool)

(assert (=> start!73846 (=> (not res!586832) (not e!481418))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49677 0))(
  ( (array!49678 (arr!23865 (Array (_ BitVec 32) (_ BitVec 64))) (size!24306 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49677)

(assert (=> start!73846 (= res!586832 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24306 _keys!868))))))

(assert (=> start!73846 e!481418))

(declare-fun tp_is_empty!16729 () Bool)

(assert (=> start!73846 tp_is_empty!16729))

(assert (=> start!73846 true))

(assert (=> start!73846 tp!51284))

(declare-fun array_inv!18934 (array!49677) Bool)

(assert (=> start!73846 (array_inv!18934 _keys!868)))

(declare-datatypes ((V!27353 0))(
  ( (V!27354 (val!8412 Int)) )
))
(declare-datatypes ((ValueCell!7925 0))(
  ( (ValueCellFull!7925 (v!10837 V!27353)) (EmptyCell!7925) )
))
(declare-datatypes ((array!49679 0))(
  ( (array!49680 (arr!23866 (Array (_ BitVec 32) ValueCell!7925)) (size!24307 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49679)

(declare-fun e!481417 () Bool)

(declare-fun array_inv!18935 (array!49679) Bool)

(assert (=> start!73846 (and (array_inv!18935 _values!688) e!481417)))

(declare-fun mapNonEmpty!26693 () Bool)

(declare-fun mapRes!26693 () Bool)

(declare-fun tp!51283 () Bool)

(declare-fun e!481416 () Bool)

(assert (=> mapNonEmpty!26693 (= mapRes!26693 (and tp!51283 e!481416))))

(declare-fun mapValue!26693 () ValueCell!7925)

(declare-fun mapKey!26693 () (_ BitVec 32))

(declare-fun mapRest!26693 () (Array (_ BitVec 32) ValueCell!7925))

(assert (=> mapNonEmpty!26693 (= (arr!23866 _values!688) (store mapRest!26693 mapKey!26693 mapValue!26693))))

(declare-fun b!863978 () Bool)

(declare-datatypes ((Unit!29488 0))(
  ( (Unit!29489) )
))
(declare-fun e!481412 () Unit!29488)

(declare-fun Unit!29490 () Unit!29488)

(assert (=> b!863978 (= e!481412 Unit!29490)))

(declare-fun lt!390250 () Unit!29488)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49677 (_ BitVec 32) (_ BitVec 32)) Unit!29488)

(assert (=> b!863978 (= lt!390250 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16892 0))(
  ( (Nil!16889) (Cons!16888 (h!18025 (_ BitVec 64)) (t!23743 List!16892)) )
))
(declare-fun arrayNoDuplicates!0 (array!49677 (_ BitVec 32) List!16892) Bool)

(assert (=> b!863978 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16889)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!390253 () Unit!29488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49677 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29488)

(assert (=> b!863978 (= lt!390253 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863978 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390254 () Unit!29488)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49677 (_ BitVec 64) (_ BitVec 32) List!16892) Unit!29488)

(assert (=> b!863978 (= lt!390254 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16889))))

(assert (=> b!863978 false))

(declare-fun b!863979 () Bool)

(declare-fun res!586837 () Bool)

(assert (=> b!863979 (=> (not res!586837) (not e!481418))))

(assert (=> b!863979 (= res!586837 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16889))))

(declare-fun b!863980 () Bool)

(declare-fun e!481413 () Bool)

(declare-fun e!481414 () Bool)

(assert (=> b!863980 (= e!481413 e!481414)))

(declare-fun res!586829 () Bool)

(assert (=> b!863980 (=> res!586829 e!481414)))

(assert (=> b!863980 (= res!586829 (= k0!854 (select (arr!23865 _keys!868) from!1053)))))

(assert (=> b!863980 (not (= (select (arr!23865 _keys!868) from!1053) k0!854))))

(declare-fun lt!390249 () Unit!29488)

(assert (=> b!863980 (= lt!390249 e!481412)))

(declare-fun c!92392 () Bool)

(assert (=> b!863980 (= c!92392 (= (select (arr!23865 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11058 0))(
  ( (tuple2!11059 (_1!5540 (_ BitVec 64)) (_2!5540 V!27353)) )
))
(declare-datatypes ((List!16893 0))(
  ( (Nil!16890) (Cons!16889 (h!18026 tuple2!11058) (t!23744 List!16893)) )
))
(declare-datatypes ((ListLongMap!9829 0))(
  ( (ListLongMap!9830 (toList!4930 List!16893)) )
))
(declare-fun lt!390246 () ListLongMap!9829)

(declare-fun lt!390242 () ListLongMap!9829)

(assert (=> b!863980 (= lt!390246 lt!390242)))

(declare-fun lt!390244 () ListLongMap!9829)

(declare-fun lt!390251 () tuple2!11058)

(declare-fun +!2333 (ListLongMap!9829 tuple2!11058) ListLongMap!9829)

(assert (=> b!863980 (= lt!390242 (+!2333 lt!390244 lt!390251))))

(declare-fun lt!390247 () V!27353)

(assert (=> b!863980 (= lt!390251 (tuple2!11059 (select (arr!23865 _keys!868) from!1053) lt!390247))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12607 (ValueCell!7925 V!27353) V!27353)

(declare-fun dynLambda!1159 (Int (_ BitVec 64)) V!27353)

(assert (=> b!863980 (= lt!390247 (get!12607 (select (arr!23866 _values!688) from!1053) (dynLambda!1159 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863981 () Bool)

(declare-fun e!481415 () Bool)

(assert (=> b!863981 (= e!481418 e!481415)))

(declare-fun res!586828 () Bool)

(assert (=> b!863981 (=> (not res!586828) (not e!481415))))

(assert (=> b!863981 (= res!586828 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27353)

(declare-fun zeroValue!654 () V!27353)

(declare-fun lt!390255 () array!49679)

(declare-fun getCurrentListMapNoExtraKeys!2981 (array!49677 array!49679 (_ BitVec 32) (_ BitVec 32) V!27353 V!27353 (_ BitVec 32) Int) ListLongMap!9829)

(assert (=> b!863981 (= lt!390246 (getCurrentListMapNoExtraKeys!2981 _keys!868 lt!390255 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27353)

(assert (=> b!863981 (= lt!390255 (array!49680 (store (arr!23866 _values!688) i!612 (ValueCellFull!7925 v!557)) (size!24307 _values!688)))))

(declare-fun lt!390245 () ListLongMap!9829)

(assert (=> b!863981 (= lt!390245 (getCurrentListMapNoExtraKeys!2981 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863982 () Bool)

(assert (=> b!863982 (= e!481415 (not e!481413))))

(declare-fun res!586827 () Bool)

(assert (=> b!863982 (=> res!586827 e!481413)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863982 (= res!586827 (not (validKeyInArray!0 (select (arr!23865 _keys!868) from!1053))))))

(declare-fun lt!390257 () ListLongMap!9829)

(assert (=> b!863982 (= lt!390257 lt!390244)))

(declare-fun lt!390248 () ListLongMap!9829)

(declare-fun lt!390256 () tuple2!11058)

(assert (=> b!863982 (= lt!390244 (+!2333 lt!390248 lt!390256))))

(assert (=> b!863982 (= lt!390257 (getCurrentListMapNoExtraKeys!2981 _keys!868 lt!390255 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863982 (= lt!390256 (tuple2!11059 k0!854 v!557))))

(assert (=> b!863982 (= lt!390248 (getCurrentListMapNoExtraKeys!2981 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390252 () Unit!29488)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!519 (array!49677 array!49679 (_ BitVec 32) (_ BitVec 32) V!27353 V!27353 (_ BitVec 32) (_ BitVec 64) V!27353 (_ BitVec 32) Int) Unit!29488)

(assert (=> b!863982 (= lt!390252 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!519 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863983 () Bool)

(assert (=> b!863983 (= e!481416 tp_is_empty!16729)))

(declare-fun b!863984 () Bool)

(declare-fun e!481420 () Bool)

(assert (=> b!863984 (= e!481420 tp_is_empty!16729)))

(declare-fun b!863985 () Bool)

(declare-fun res!586833 () Bool)

(assert (=> b!863985 (=> (not res!586833) (not e!481418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863985 (= res!586833 (validMask!0 mask!1196))))

(declare-fun b!863986 () Bool)

(declare-fun res!586835 () Bool)

(assert (=> b!863986 (=> (not res!586835) (not e!481418))))

(assert (=> b!863986 (= res!586835 (validKeyInArray!0 k0!854))))

(declare-fun b!863987 () Bool)

(declare-fun res!586830 () Bool)

(assert (=> b!863987 (=> (not res!586830) (not e!481418))))

(assert (=> b!863987 (= res!586830 (and (= (select (arr!23865 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863988 () Bool)

(assert (=> b!863988 (= e!481414 true)))

(assert (=> b!863988 (= lt!390242 (+!2333 (+!2333 lt!390248 lt!390251) lt!390256))))

(declare-fun lt!390243 () Unit!29488)

(declare-fun addCommutativeForDiffKeys!486 (ListLongMap!9829 (_ BitVec 64) V!27353 (_ BitVec 64) V!27353) Unit!29488)

(assert (=> b!863988 (= lt!390243 (addCommutativeForDiffKeys!486 lt!390248 k0!854 v!557 (select (arr!23865 _keys!868) from!1053) lt!390247))))

(declare-fun b!863989 () Bool)

(declare-fun res!586834 () Bool)

(assert (=> b!863989 (=> (not res!586834) (not e!481418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49677 (_ BitVec 32)) Bool)

(assert (=> b!863989 (= res!586834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863990 () Bool)

(declare-fun res!586831 () Bool)

(assert (=> b!863990 (=> (not res!586831) (not e!481418))))

(assert (=> b!863990 (= res!586831 (and (= (size!24307 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24306 _keys!868) (size!24307 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863991 () Bool)

(declare-fun res!586836 () Bool)

(assert (=> b!863991 (=> (not res!586836) (not e!481418))))

(assert (=> b!863991 (= res!586836 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24306 _keys!868))))))

(declare-fun mapIsEmpty!26693 () Bool)

(assert (=> mapIsEmpty!26693 mapRes!26693))

(declare-fun b!863992 () Bool)

(declare-fun Unit!29491 () Unit!29488)

(assert (=> b!863992 (= e!481412 Unit!29491)))

(declare-fun b!863993 () Bool)

(assert (=> b!863993 (= e!481417 (and e!481420 mapRes!26693))))

(declare-fun condMapEmpty!26693 () Bool)

(declare-fun mapDefault!26693 () ValueCell!7925)

(assert (=> b!863993 (= condMapEmpty!26693 (= (arr!23866 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7925)) mapDefault!26693)))))

(assert (= (and start!73846 res!586832) b!863985))

(assert (= (and b!863985 res!586833) b!863990))

(assert (= (and b!863990 res!586831) b!863989))

(assert (= (and b!863989 res!586834) b!863979))

(assert (= (and b!863979 res!586837) b!863991))

(assert (= (and b!863991 res!586836) b!863986))

(assert (= (and b!863986 res!586835) b!863987))

(assert (= (and b!863987 res!586830) b!863981))

(assert (= (and b!863981 res!586828) b!863982))

(assert (= (and b!863982 (not res!586827)) b!863980))

(assert (= (and b!863980 c!92392) b!863978))

(assert (= (and b!863980 (not c!92392)) b!863992))

(assert (= (and b!863980 (not res!586829)) b!863988))

(assert (= (and b!863993 condMapEmpty!26693) mapIsEmpty!26693))

(assert (= (and b!863993 (not condMapEmpty!26693)) mapNonEmpty!26693))

(get-info :version)

(assert (= (and mapNonEmpty!26693 ((_ is ValueCellFull!7925) mapValue!26693)) b!863983))

(assert (= (and b!863993 ((_ is ValueCellFull!7925) mapDefault!26693)) b!863984))

(assert (= start!73846 b!863993))

(declare-fun b_lambda!11959 () Bool)

(assert (=> (not b_lambda!11959) (not b!863980)))

(declare-fun t!23742 () Bool)

(declare-fun tb!4707 () Bool)

(assert (=> (and start!73846 (= defaultEntry!696 defaultEntry!696) t!23742) tb!4707))

(declare-fun result!9033 () Bool)

(assert (=> tb!4707 (= result!9033 tp_is_empty!16729)))

(assert (=> b!863980 t!23742))

(declare-fun b_and!24177 () Bool)

(assert (= b_and!24175 (and (=> t!23742 result!9033) b_and!24177)))

(declare-fun m!805487 () Bool)

(assert (=> b!863982 m!805487))

(declare-fun m!805489 () Bool)

(assert (=> b!863982 m!805489))

(declare-fun m!805491 () Bool)

(assert (=> b!863982 m!805491))

(declare-fun m!805493 () Bool)

(assert (=> b!863982 m!805493))

(assert (=> b!863982 m!805491))

(declare-fun m!805495 () Bool)

(assert (=> b!863982 m!805495))

(declare-fun m!805497 () Bool)

(assert (=> b!863982 m!805497))

(declare-fun m!805499 () Bool)

(assert (=> b!863986 m!805499))

(declare-fun m!805501 () Bool)

(assert (=> b!863989 m!805501))

(declare-fun m!805503 () Bool)

(assert (=> b!863987 m!805503))

(declare-fun m!805505 () Bool)

(assert (=> b!863978 m!805505))

(declare-fun m!805507 () Bool)

(assert (=> b!863978 m!805507))

(declare-fun m!805509 () Bool)

(assert (=> b!863978 m!805509))

(declare-fun m!805511 () Bool)

(assert (=> b!863978 m!805511))

(declare-fun m!805513 () Bool)

(assert (=> b!863978 m!805513))

(declare-fun m!805515 () Bool)

(assert (=> b!863979 m!805515))

(declare-fun m!805517 () Bool)

(assert (=> start!73846 m!805517))

(declare-fun m!805519 () Bool)

(assert (=> start!73846 m!805519))

(declare-fun m!805521 () Bool)

(assert (=> b!863980 m!805521))

(declare-fun m!805523 () Bool)

(assert (=> b!863980 m!805523))

(declare-fun m!805525 () Bool)

(assert (=> b!863980 m!805525))

(declare-fun m!805527 () Bool)

(assert (=> b!863980 m!805527))

(assert (=> b!863980 m!805523))

(assert (=> b!863980 m!805491))

(assert (=> b!863980 m!805525))

(declare-fun m!805529 () Bool)

(assert (=> b!863985 m!805529))

(declare-fun m!805531 () Bool)

(assert (=> b!863988 m!805531))

(assert (=> b!863988 m!805531))

(declare-fun m!805533 () Bool)

(assert (=> b!863988 m!805533))

(assert (=> b!863988 m!805491))

(assert (=> b!863988 m!805491))

(declare-fun m!805535 () Bool)

(assert (=> b!863988 m!805535))

(declare-fun m!805537 () Bool)

(assert (=> b!863981 m!805537))

(declare-fun m!805539 () Bool)

(assert (=> b!863981 m!805539))

(declare-fun m!805541 () Bool)

(assert (=> b!863981 m!805541))

(declare-fun m!805543 () Bool)

(assert (=> mapNonEmpty!26693 m!805543))

(check-sat (not b!863981) (not b!863980) (not mapNonEmpty!26693) (not start!73846) (not b_next!14593) (not b!863986) (not b!863988) b_and!24177 (not b!863982) (not b!863978) tp_is_empty!16729 (not b!863979) (not b_lambda!11959) (not b!863985) (not b!863989))
(check-sat b_and!24177 (not b_next!14593))
