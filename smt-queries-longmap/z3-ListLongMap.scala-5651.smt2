; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73858 () Bool)

(assert start!73858)

(declare-fun b_free!14605 () Bool)

(declare-fun b_next!14605 () Bool)

(assert (=> start!73858 (= b_free!14605 (not b_next!14605))))

(declare-fun tp!51319 () Bool)

(declare-fun b_and!24199 () Bool)

(assert (=> start!73858 (= tp!51319 b_and!24199)))

(declare-fun b!864278 () Bool)

(declare-fun e!481576 () Bool)

(declare-fun tp_is_empty!16741 () Bool)

(assert (=> b!864278 (= e!481576 tp_is_empty!16741)))

(declare-fun b!864279 () Bool)

(declare-fun e!481577 () Bool)

(declare-fun mapRes!26711 () Bool)

(assert (=> b!864279 (= e!481577 (and e!481576 mapRes!26711))))

(declare-fun condMapEmpty!26711 () Bool)

(declare-datatypes ((V!27369 0))(
  ( (V!27370 (val!8418 Int)) )
))
(declare-datatypes ((ValueCell!7931 0))(
  ( (ValueCellFull!7931 (v!10843 V!27369)) (EmptyCell!7931) )
))
(declare-datatypes ((array!49697 0))(
  ( (array!49698 (arr!23875 (Array (_ BitVec 32) ValueCell!7931)) (size!24316 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49697)

(declare-fun mapDefault!26711 () ValueCell!7931)

(assert (=> b!864279 (= condMapEmpty!26711 (= (arr!23875 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7931)) mapDefault!26711)))))

(declare-fun b!864280 () Bool)

(declare-fun res!587033 () Bool)

(declare-fun e!481575 () Bool)

(assert (=> b!864280 (=> (not res!587033) (not e!481575))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864280 (= res!587033 (validMask!0 mask!1196))))

(declare-fun b!864281 () Bool)

(declare-fun e!481579 () Bool)

(declare-fun e!481578 () Bool)

(assert (=> b!864281 (= e!481579 e!481578)))

(declare-fun res!587029 () Bool)

(assert (=> b!864281 (=> res!587029 e!481578)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49699 0))(
  ( (array!49700 (arr!23876 (Array (_ BitVec 32) (_ BitVec 64))) (size!24317 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49699)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864281 (= res!587029 (= k0!854 (select (arr!23876 _keys!868) from!1053)))))

(assert (=> b!864281 (not (= (select (arr!23876 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29500 0))(
  ( (Unit!29501) )
))
(declare-fun lt!390544 () Unit!29500)

(declare-fun e!481582 () Unit!29500)

(assert (=> b!864281 (= lt!390544 e!481582)))

(declare-fun c!92410 () Bool)

(assert (=> b!864281 (= c!92410 (= (select (arr!23876 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11064 0))(
  ( (tuple2!11065 (_1!5543 (_ BitVec 64)) (_2!5543 V!27369)) )
))
(declare-datatypes ((List!16898 0))(
  ( (Nil!16895) (Cons!16894 (h!18031 tuple2!11064) (t!23761 List!16898)) )
))
(declare-datatypes ((ListLongMap!9835 0))(
  ( (ListLongMap!9836 (toList!4933 List!16898)) )
))
(declare-fun lt!390539 () ListLongMap!9835)

(declare-fun lt!390534 () ListLongMap!9835)

(assert (=> b!864281 (= lt!390539 lt!390534)))

(declare-fun lt!390541 () ListLongMap!9835)

(declare-fun lt!390542 () tuple2!11064)

(declare-fun +!2336 (ListLongMap!9835 tuple2!11064) ListLongMap!9835)

(assert (=> b!864281 (= lt!390534 (+!2336 lt!390541 lt!390542))))

(declare-fun lt!390538 () V!27369)

(assert (=> b!864281 (= lt!390542 (tuple2!11065 (select (arr!23876 _keys!868) from!1053) lt!390538))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12614 (ValueCell!7931 V!27369) V!27369)

(declare-fun dynLambda!1162 (Int (_ BitVec 64)) V!27369)

(assert (=> b!864281 (= lt!390538 (get!12614 (select (arr!23875 _values!688) from!1053) (dynLambda!1162 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864282 () Bool)

(declare-fun res!587032 () Bool)

(assert (=> b!864282 (=> (not res!587032) (not e!481575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49699 (_ BitVec 32)) Bool)

(assert (=> b!864282 (= res!587032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864283 () Bool)

(declare-fun res!587031 () Bool)

(assert (=> b!864283 (=> (not res!587031) (not e!481575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864283 (= res!587031 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26711 () Bool)

(declare-fun tp!51320 () Bool)

(declare-fun e!481581 () Bool)

(assert (=> mapNonEmpty!26711 (= mapRes!26711 (and tp!51320 e!481581))))

(declare-fun mapRest!26711 () (Array (_ BitVec 32) ValueCell!7931))

(declare-fun mapValue!26711 () ValueCell!7931)

(declare-fun mapKey!26711 () (_ BitVec 32))

(assert (=> mapNonEmpty!26711 (= (arr!23875 _values!688) (store mapRest!26711 mapKey!26711 mapValue!26711))))

(declare-fun b!864284 () Bool)

(declare-fun Unit!29502 () Unit!29500)

(assert (=> b!864284 (= e!481582 Unit!29502)))

(declare-fun b!864286 () Bool)

(declare-fun res!587028 () Bool)

(assert (=> b!864286 (=> (not res!587028) (not e!481575))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864286 (= res!587028 (and (= (select (arr!23876 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864287 () Bool)

(declare-fun res!587030 () Bool)

(assert (=> b!864287 (=> (not res!587030) (not e!481575))))

(declare-datatypes ((List!16899 0))(
  ( (Nil!16896) (Cons!16895 (h!18032 (_ BitVec 64)) (t!23762 List!16899)) )
))
(declare-fun arrayNoDuplicates!0 (array!49699 (_ BitVec 32) List!16899) Bool)

(assert (=> b!864287 (= res!587030 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16896))))

(declare-fun b!864288 () Bool)

(declare-fun Unit!29503 () Unit!29500)

(assert (=> b!864288 (= e!481582 Unit!29503)))

(declare-fun lt!390543 () Unit!29500)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49699 (_ BitVec 32) (_ BitVec 32)) Unit!29500)

(assert (=> b!864288 (= lt!390543 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!864288 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16896)))

(declare-fun lt!390530 () Unit!29500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49699 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29500)

(assert (=> b!864288 (= lt!390530 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864288 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390533 () Unit!29500)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49699 (_ BitVec 64) (_ BitVec 32) List!16899) Unit!29500)

(assert (=> b!864288 (= lt!390533 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16896))))

(assert (=> b!864288 false))

(declare-fun b!864289 () Bool)

(declare-fun e!481574 () Bool)

(assert (=> b!864289 (= e!481574 (not e!481579))))

(declare-fun res!587027 () Bool)

(assert (=> b!864289 (=> res!587027 e!481579)))

(assert (=> b!864289 (= res!587027 (not (validKeyInArray!0 (select (arr!23876 _keys!868) from!1053))))))

(declare-fun lt!390537 () ListLongMap!9835)

(assert (=> b!864289 (= lt!390537 lt!390541)))

(declare-fun lt!390536 () ListLongMap!9835)

(declare-fun lt!390531 () tuple2!11064)

(assert (=> b!864289 (= lt!390541 (+!2336 lt!390536 lt!390531))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27369)

(declare-fun zeroValue!654 () V!27369)

(declare-fun lt!390545 () array!49697)

(declare-fun getCurrentListMapNoExtraKeys!2984 (array!49699 array!49697 (_ BitVec 32) (_ BitVec 32) V!27369 V!27369 (_ BitVec 32) Int) ListLongMap!9835)

(assert (=> b!864289 (= lt!390537 (getCurrentListMapNoExtraKeys!2984 _keys!868 lt!390545 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27369)

(assert (=> b!864289 (= lt!390531 (tuple2!11065 k0!854 v!557))))

(assert (=> b!864289 (= lt!390536 (getCurrentListMapNoExtraKeys!2984 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390532 () Unit!29500)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!522 (array!49699 array!49697 (_ BitVec 32) (_ BitVec 32) V!27369 V!27369 (_ BitVec 32) (_ BitVec 64) V!27369 (_ BitVec 32) Int) Unit!29500)

(assert (=> b!864289 (= lt!390532 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!522 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26711 () Bool)

(assert (=> mapIsEmpty!26711 mapRes!26711))

(declare-fun b!864290 () Bool)

(declare-fun res!587025 () Bool)

(assert (=> b!864290 (=> (not res!587025) (not e!481575))))

(assert (=> b!864290 (= res!587025 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24317 _keys!868))))))

(declare-fun b!864291 () Bool)

(assert (=> b!864291 (= e!481581 tp_is_empty!16741)))

(declare-fun b!864292 () Bool)

(declare-fun res!587026 () Bool)

(assert (=> b!864292 (=> (not res!587026) (not e!481575))))

(assert (=> b!864292 (= res!587026 (and (= (size!24316 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24317 _keys!868) (size!24316 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864293 () Bool)

(assert (=> b!864293 (= e!481575 e!481574)))

(declare-fun res!587034 () Bool)

(assert (=> b!864293 (=> (not res!587034) (not e!481574))))

(assert (=> b!864293 (= res!587034 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864293 (= lt!390539 (getCurrentListMapNoExtraKeys!2984 _keys!868 lt!390545 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864293 (= lt!390545 (array!49698 (store (arr!23875 _values!688) i!612 (ValueCellFull!7931 v!557)) (size!24316 _values!688)))))

(declare-fun lt!390540 () ListLongMap!9835)

(assert (=> b!864293 (= lt!390540 (getCurrentListMapNoExtraKeys!2984 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!587035 () Bool)

(assert (=> start!73858 (=> (not res!587035) (not e!481575))))

(assert (=> start!73858 (= res!587035 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24317 _keys!868))))))

(assert (=> start!73858 e!481575))

(assert (=> start!73858 tp_is_empty!16741))

(assert (=> start!73858 true))

(assert (=> start!73858 tp!51319))

(declare-fun array_inv!18940 (array!49699) Bool)

(assert (=> start!73858 (array_inv!18940 _keys!868)))

(declare-fun array_inv!18941 (array!49697) Bool)

(assert (=> start!73858 (and (array_inv!18941 _values!688) e!481577)))

(declare-fun b!864285 () Bool)

(assert (=> b!864285 (= e!481578 true)))

(assert (=> b!864285 (= lt!390534 (+!2336 (+!2336 lt!390536 lt!390542) lt!390531))))

(declare-fun lt!390535 () Unit!29500)

(declare-fun addCommutativeForDiffKeys!489 (ListLongMap!9835 (_ BitVec 64) V!27369 (_ BitVec 64) V!27369) Unit!29500)

(assert (=> b!864285 (= lt!390535 (addCommutativeForDiffKeys!489 lt!390536 k0!854 v!557 (select (arr!23876 _keys!868) from!1053) lt!390538))))

(assert (= (and start!73858 res!587035) b!864280))

(assert (= (and b!864280 res!587033) b!864292))

(assert (= (and b!864292 res!587026) b!864282))

(assert (= (and b!864282 res!587032) b!864287))

(assert (= (and b!864287 res!587030) b!864290))

(assert (= (and b!864290 res!587025) b!864283))

(assert (= (and b!864283 res!587031) b!864286))

(assert (= (and b!864286 res!587028) b!864293))

(assert (= (and b!864293 res!587034) b!864289))

(assert (= (and b!864289 (not res!587027)) b!864281))

(assert (= (and b!864281 c!92410) b!864288))

(assert (= (and b!864281 (not c!92410)) b!864284))

(assert (= (and b!864281 (not res!587029)) b!864285))

(assert (= (and b!864279 condMapEmpty!26711) mapIsEmpty!26711))

(assert (= (and b!864279 (not condMapEmpty!26711)) mapNonEmpty!26711))

(get-info :version)

(assert (= (and mapNonEmpty!26711 ((_ is ValueCellFull!7931) mapValue!26711)) b!864291))

(assert (= (and b!864279 ((_ is ValueCellFull!7931) mapDefault!26711)) b!864278))

(assert (= start!73858 b!864279))

(declare-fun b_lambda!11971 () Bool)

(assert (=> (not b_lambda!11971) (not b!864281)))

(declare-fun t!23760 () Bool)

(declare-fun tb!4719 () Bool)

(assert (=> (and start!73858 (= defaultEntry!696 defaultEntry!696) t!23760) tb!4719))

(declare-fun result!9057 () Bool)

(assert (=> tb!4719 (= result!9057 tp_is_empty!16741)))

(assert (=> b!864281 t!23760))

(declare-fun b_and!24201 () Bool)

(assert (= b_and!24199 (and (=> t!23760 result!9057) b_and!24201)))

(declare-fun m!805835 () Bool)

(assert (=> b!864283 m!805835))

(declare-fun m!805837 () Bool)

(assert (=> b!864286 m!805837))

(declare-fun m!805839 () Bool)

(assert (=> b!864288 m!805839))

(declare-fun m!805841 () Bool)

(assert (=> b!864288 m!805841))

(declare-fun m!805843 () Bool)

(assert (=> b!864288 m!805843))

(declare-fun m!805845 () Bool)

(assert (=> b!864288 m!805845))

(declare-fun m!805847 () Bool)

(assert (=> b!864288 m!805847))

(declare-fun m!805849 () Bool)

(assert (=> mapNonEmpty!26711 m!805849))

(declare-fun m!805851 () Bool)

(assert (=> b!864282 m!805851))

(declare-fun m!805853 () Bool)

(assert (=> b!864293 m!805853))

(declare-fun m!805855 () Bool)

(assert (=> b!864293 m!805855))

(declare-fun m!805857 () Bool)

(assert (=> b!864293 m!805857))

(declare-fun m!805859 () Bool)

(assert (=> b!864287 m!805859))

(declare-fun m!805861 () Bool)

(assert (=> b!864280 m!805861))

(declare-fun m!805863 () Bool)

(assert (=> b!864289 m!805863))

(declare-fun m!805865 () Bool)

(assert (=> b!864289 m!805865))

(declare-fun m!805867 () Bool)

(assert (=> b!864289 m!805867))

(declare-fun m!805869 () Bool)

(assert (=> b!864289 m!805869))

(assert (=> b!864289 m!805867))

(declare-fun m!805871 () Bool)

(assert (=> b!864289 m!805871))

(declare-fun m!805873 () Bool)

(assert (=> b!864289 m!805873))

(declare-fun m!805875 () Bool)

(assert (=> start!73858 m!805875))

(declare-fun m!805877 () Bool)

(assert (=> start!73858 m!805877))

(declare-fun m!805879 () Bool)

(assert (=> b!864281 m!805879))

(assert (=> b!864281 m!805867))

(declare-fun m!805881 () Bool)

(assert (=> b!864281 m!805881))

(assert (=> b!864281 m!805879))

(assert (=> b!864281 m!805881))

(declare-fun m!805883 () Bool)

(assert (=> b!864281 m!805883))

(declare-fun m!805885 () Bool)

(assert (=> b!864281 m!805885))

(declare-fun m!805887 () Bool)

(assert (=> b!864285 m!805887))

(assert (=> b!864285 m!805887))

(declare-fun m!805889 () Bool)

(assert (=> b!864285 m!805889))

(assert (=> b!864285 m!805867))

(assert (=> b!864285 m!805867))

(declare-fun m!805891 () Bool)

(assert (=> b!864285 m!805891))

(check-sat (not b!864285) (not b!864282) (not b!864289) (not b!864280) (not b!864283) (not b_lambda!11971) (not b!864281) (not mapNonEmpty!26711) (not start!73858) (not b_next!14605) (not b!864288) tp_is_empty!16741 b_and!24201 (not b!864293) (not b!864287))
(check-sat b_and!24201 (not b_next!14605))
