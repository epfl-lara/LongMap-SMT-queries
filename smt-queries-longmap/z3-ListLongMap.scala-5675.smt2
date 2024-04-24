; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74002 () Bool)

(assert start!74002)

(declare-fun b_free!14749 () Bool)

(declare-fun b_next!14749 () Bool)

(assert (=> start!74002 (= b_free!14749 (not b_next!14749))))

(declare-fun tp!51751 () Bool)

(declare-fun b_and!24487 () Bool)

(assert (=> start!74002 (= tp!51751 b_and!24487)))

(declare-fun b!867878 () Bool)

(declare-fun res!589401 () Bool)

(declare-fun e!483526 () Bool)

(assert (=> b!867878 (=> (not res!589401) (not e!483526))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867878 (= res!589401 (validMask!0 mask!1196))))

(declare-fun b!867879 () Bool)

(declare-fun res!589404 () Bool)

(assert (=> b!867879 (=> (not res!589404) (not e!483526))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49979 0))(
  ( (array!49980 (arr!24016 (Array (_ BitVec 32) (_ BitVec 64))) (size!24457 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49979)

(assert (=> b!867879 (= res!589404 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24457 _keys!868))))))

(declare-fun b!867880 () Bool)

(declare-fun e!483522 () Bool)

(declare-fun e!483518 () Bool)

(assert (=> b!867880 (= e!483522 (not e!483518))))

(declare-fun res!589409 () Bool)

(assert (=> b!867880 (=> res!589409 e!483518)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867880 (= res!589409 (not (validKeyInArray!0 (select (arr!24016 _keys!868) from!1053))))))

(declare-datatypes ((V!27561 0))(
  ( (V!27562 (val!8490 Int)) )
))
(declare-datatypes ((tuple2!11186 0))(
  ( (tuple2!11187 (_1!5604 (_ BitVec 64)) (_2!5604 V!27561)) )
))
(declare-datatypes ((List!17013 0))(
  ( (Nil!17010) (Cons!17009 (h!18146 tuple2!11186) (t!24020 List!17013)) )
))
(declare-datatypes ((ListLongMap!9957 0))(
  ( (ListLongMap!9958 (toList!4994 List!17013)) )
))
(declare-fun lt!393995 () ListLongMap!9957)

(declare-fun lt!393991 () ListLongMap!9957)

(assert (=> b!867880 (= lt!393995 lt!393991)))

(declare-fun lt!393998 () ListLongMap!9957)

(declare-fun lt!393990 () tuple2!11186)

(declare-fun +!2397 (ListLongMap!9957 tuple2!11186) ListLongMap!9957)

(assert (=> b!867880 (= lt!393991 (+!2397 lt!393998 lt!393990))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27561)

(declare-datatypes ((ValueCell!8003 0))(
  ( (ValueCellFull!8003 (v!10915 V!27561)) (EmptyCell!8003) )
))
(declare-datatypes ((array!49981 0))(
  ( (array!49982 (arr!24017 (Array (_ BitVec 32) ValueCell!8003)) (size!24458 (_ BitVec 32))) )
))
(declare-fun lt!394000 () array!49981)

(declare-fun zeroValue!654 () V!27561)

(declare-fun getCurrentListMapNoExtraKeys!3038 (array!49979 array!49981 (_ BitVec 32) (_ BitVec 32) V!27561 V!27561 (_ BitVec 32) Int) ListLongMap!9957)

(assert (=> b!867880 (= lt!393995 (getCurrentListMapNoExtraKeys!3038 _keys!868 lt!394000 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27561)

(assert (=> b!867880 (= lt!393990 (tuple2!11187 k0!854 v!557))))

(declare-fun _values!688 () array!49981)

(assert (=> b!867880 (= lt!393998 (getCurrentListMapNoExtraKeys!3038 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29726 0))(
  ( (Unit!29727) )
))
(declare-fun lt!393994 () Unit!29726)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!570 (array!49979 array!49981 (_ BitVec 32) (_ BitVec 32) V!27561 V!27561 (_ BitVec 32) (_ BitVec 64) V!27561 (_ BitVec 32) Int) Unit!29726)

(assert (=> b!867880 (= lt!393994 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!570 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867881 () Bool)

(declare-fun res!589411 () Bool)

(assert (=> b!867881 (=> (not res!589411) (not e!483526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49979 (_ BitVec 32)) Bool)

(assert (=> b!867881 (= res!589411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867882 () Bool)

(declare-fun e!483521 () Bool)

(declare-fun tp_is_empty!16885 () Bool)

(assert (=> b!867882 (= e!483521 tp_is_empty!16885)))

(declare-fun b!867883 () Bool)

(declare-fun res!589402 () Bool)

(assert (=> b!867883 (=> (not res!589402) (not e!483526))))

(declare-datatypes ((List!17014 0))(
  ( (Nil!17011) (Cons!17010 (h!18147 (_ BitVec 64)) (t!24021 List!17014)) )
))
(declare-fun arrayNoDuplicates!0 (array!49979 (_ BitVec 32) List!17014) Bool)

(assert (=> b!867883 (= res!589402 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17011))))

(declare-fun res!589410 () Bool)

(assert (=> start!74002 (=> (not res!589410) (not e!483526))))

(assert (=> start!74002 (= res!589410 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24457 _keys!868))))))

(assert (=> start!74002 e!483526))

(assert (=> start!74002 tp_is_empty!16885))

(assert (=> start!74002 true))

(assert (=> start!74002 tp!51751))

(declare-fun array_inv!19034 (array!49979) Bool)

(assert (=> start!74002 (array_inv!19034 _keys!868)))

(declare-fun e!483524 () Bool)

(declare-fun array_inv!19035 (array!49981) Bool)

(assert (=> start!74002 (and (array_inv!19035 _values!688) e!483524)))

(declare-fun b!867884 () Bool)

(declare-fun e!483519 () Unit!29726)

(declare-fun Unit!29728 () Unit!29726)

(assert (=> b!867884 (= e!483519 Unit!29728)))

(declare-fun b!867885 () Bool)

(declare-fun res!589405 () Bool)

(assert (=> b!867885 (=> (not res!589405) (not e!483526))))

(assert (=> b!867885 (= res!589405 (validKeyInArray!0 k0!854))))

(declare-fun b!867886 () Bool)

(declare-fun mapRes!26927 () Bool)

(assert (=> b!867886 (= e!483524 (and e!483521 mapRes!26927))))

(declare-fun condMapEmpty!26927 () Bool)

(declare-fun mapDefault!26927 () ValueCell!8003)

(assert (=> b!867886 (= condMapEmpty!26927 (= (arr!24017 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8003)) mapDefault!26927)))))

(declare-fun b!867887 () Bool)

(declare-fun e!483525 () Bool)

(assert (=> b!867887 (= e!483525 true)))

(declare-fun lt!393993 () tuple2!11186)

(declare-fun lt!393989 () ListLongMap!9957)

(assert (=> b!867887 (= lt!393989 (+!2397 (+!2397 lt!393998 lt!393993) lt!393990))))

(declare-fun lt!394001 () V!27561)

(declare-fun lt!393992 () Unit!29726)

(declare-fun addCommutativeForDiffKeys!538 (ListLongMap!9957 (_ BitVec 64) V!27561 (_ BitVec 64) V!27561) Unit!29726)

(assert (=> b!867887 (= lt!393992 (addCommutativeForDiffKeys!538 lt!393998 k0!854 v!557 (select (arr!24016 _keys!868) from!1053) lt!394001))))

(declare-fun mapIsEmpty!26927 () Bool)

(assert (=> mapIsEmpty!26927 mapRes!26927))

(declare-fun b!867888 () Bool)

(declare-fun Unit!29729 () Unit!29726)

(assert (=> b!867888 (= e!483519 Unit!29729)))

(declare-fun lt!393987 () Unit!29726)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49979 (_ BitVec 32) (_ BitVec 32)) Unit!29726)

(assert (=> b!867888 (= lt!393987 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!867888 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17011)))

(declare-fun lt!393986 () Unit!29726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49979 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29726)

(assert (=> b!867888 (= lt!393986 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867888 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393997 () Unit!29726)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49979 (_ BitVec 64) (_ BitVec 32) List!17014) Unit!29726)

(assert (=> b!867888 (= lt!393997 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17011))))

(assert (=> b!867888 false))

(declare-fun mapNonEmpty!26927 () Bool)

(declare-fun tp!51752 () Bool)

(declare-fun e!483523 () Bool)

(assert (=> mapNonEmpty!26927 (= mapRes!26927 (and tp!51752 e!483523))))

(declare-fun mapValue!26927 () ValueCell!8003)

(declare-fun mapRest!26927 () (Array (_ BitVec 32) ValueCell!8003))

(declare-fun mapKey!26927 () (_ BitVec 32))

(assert (=> mapNonEmpty!26927 (= (arr!24017 _values!688) (store mapRest!26927 mapKey!26927 mapValue!26927))))

(declare-fun b!867889 () Bool)

(assert (=> b!867889 (= e!483523 tp_is_empty!16885)))

(declare-fun b!867890 () Bool)

(assert (=> b!867890 (= e!483518 e!483525)))

(declare-fun res!589403 () Bool)

(assert (=> b!867890 (=> res!589403 e!483525)))

(assert (=> b!867890 (= res!589403 (= k0!854 (select (arr!24016 _keys!868) from!1053)))))

(assert (=> b!867890 (not (= (select (arr!24016 _keys!868) from!1053) k0!854))))

(declare-fun lt!393999 () Unit!29726)

(assert (=> b!867890 (= lt!393999 e!483519)))

(declare-fun c!92626 () Bool)

(assert (=> b!867890 (= c!92626 (= (select (arr!24016 _keys!868) from!1053) k0!854))))

(declare-fun lt!393988 () ListLongMap!9957)

(assert (=> b!867890 (= lt!393988 lt!393989)))

(assert (=> b!867890 (= lt!393989 (+!2397 lt!393991 lt!393993))))

(assert (=> b!867890 (= lt!393993 (tuple2!11187 (select (arr!24016 _keys!868) from!1053) lt!394001))))

(declare-fun get!12716 (ValueCell!8003 V!27561) V!27561)

(declare-fun dynLambda!1216 (Int (_ BitVec 64)) V!27561)

(assert (=> b!867890 (= lt!394001 (get!12716 (select (arr!24017 _values!688) from!1053) (dynLambda!1216 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867891 () Bool)

(assert (=> b!867891 (= e!483526 e!483522)))

(declare-fun res!589406 () Bool)

(assert (=> b!867891 (=> (not res!589406) (not e!483522))))

(assert (=> b!867891 (= res!589406 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!867891 (= lt!393988 (getCurrentListMapNoExtraKeys!3038 _keys!868 lt!394000 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867891 (= lt!394000 (array!49982 (store (arr!24017 _values!688) i!612 (ValueCellFull!8003 v!557)) (size!24458 _values!688)))))

(declare-fun lt!393996 () ListLongMap!9957)

(assert (=> b!867891 (= lt!393996 (getCurrentListMapNoExtraKeys!3038 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867892 () Bool)

(declare-fun res!589407 () Bool)

(assert (=> b!867892 (=> (not res!589407) (not e!483526))))

(assert (=> b!867892 (= res!589407 (and (= (size!24458 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24457 _keys!868) (size!24458 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867893 () Bool)

(declare-fun res!589408 () Bool)

(assert (=> b!867893 (=> (not res!589408) (not e!483526))))

(assert (=> b!867893 (= res!589408 (and (= (select (arr!24016 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74002 res!589410) b!867878))

(assert (= (and b!867878 res!589401) b!867892))

(assert (= (and b!867892 res!589407) b!867881))

(assert (= (and b!867881 res!589411) b!867883))

(assert (= (and b!867883 res!589402) b!867879))

(assert (= (and b!867879 res!589404) b!867885))

(assert (= (and b!867885 res!589405) b!867893))

(assert (= (and b!867893 res!589408) b!867891))

(assert (= (and b!867891 res!589406) b!867880))

(assert (= (and b!867880 (not res!589409)) b!867890))

(assert (= (and b!867890 c!92626) b!867888))

(assert (= (and b!867890 (not c!92626)) b!867884))

(assert (= (and b!867890 (not res!589403)) b!867887))

(assert (= (and b!867886 condMapEmpty!26927) mapIsEmpty!26927))

(assert (= (and b!867886 (not condMapEmpty!26927)) mapNonEmpty!26927))

(get-info :version)

(assert (= (and mapNonEmpty!26927 ((_ is ValueCellFull!8003) mapValue!26927)) b!867889))

(assert (= (and b!867886 ((_ is ValueCellFull!8003) mapDefault!26927)) b!867882))

(assert (= start!74002 b!867886))

(declare-fun b_lambda!12115 () Bool)

(assert (=> (not b_lambda!12115) (not b!867890)))

(declare-fun t!24019 () Bool)

(declare-fun tb!4863 () Bool)

(assert (=> (and start!74002 (= defaultEntry!696 defaultEntry!696) t!24019) tb!4863))

(declare-fun result!9345 () Bool)

(assert (=> tb!4863 (= result!9345 tp_is_empty!16885)))

(assert (=> b!867890 t!24019))

(declare-fun b_and!24489 () Bool)

(assert (= b_and!24487 (and (=> t!24019 result!9345) b_and!24489)))

(declare-fun m!810011 () Bool)

(assert (=> b!867885 m!810011))

(declare-fun m!810013 () Bool)

(assert (=> b!867891 m!810013))

(declare-fun m!810015 () Bool)

(assert (=> b!867891 m!810015))

(declare-fun m!810017 () Bool)

(assert (=> b!867891 m!810017))

(declare-fun m!810019 () Bool)

(assert (=> b!867878 m!810019))

(declare-fun m!810021 () Bool)

(assert (=> b!867881 m!810021))

(declare-fun m!810023 () Bool)

(assert (=> b!867888 m!810023))

(declare-fun m!810025 () Bool)

(assert (=> b!867888 m!810025))

(declare-fun m!810027 () Bool)

(assert (=> b!867888 m!810027))

(declare-fun m!810029 () Bool)

(assert (=> b!867888 m!810029))

(declare-fun m!810031 () Bool)

(assert (=> b!867888 m!810031))

(declare-fun m!810033 () Bool)

(assert (=> b!867890 m!810033))

(declare-fun m!810035 () Bool)

(assert (=> b!867890 m!810035))

(declare-fun m!810037 () Bool)

(assert (=> b!867890 m!810037))

(declare-fun m!810039 () Bool)

(assert (=> b!867890 m!810039))

(assert (=> b!867890 m!810035))

(declare-fun m!810041 () Bool)

(assert (=> b!867890 m!810041))

(assert (=> b!867890 m!810037))

(declare-fun m!810043 () Bool)

(assert (=> b!867883 m!810043))

(declare-fun m!810045 () Bool)

(assert (=> start!74002 m!810045))

(declare-fun m!810047 () Bool)

(assert (=> start!74002 m!810047))

(declare-fun m!810049 () Bool)

(assert (=> mapNonEmpty!26927 m!810049))

(declare-fun m!810051 () Bool)

(assert (=> b!867880 m!810051))

(assert (=> b!867880 m!810041))

(declare-fun m!810053 () Bool)

(assert (=> b!867880 m!810053))

(declare-fun m!810055 () Bool)

(assert (=> b!867880 m!810055))

(declare-fun m!810057 () Bool)

(assert (=> b!867880 m!810057))

(declare-fun m!810059 () Bool)

(assert (=> b!867880 m!810059))

(assert (=> b!867880 m!810041))

(declare-fun m!810061 () Bool)

(assert (=> b!867887 m!810061))

(assert (=> b!867887 m!810061))

(declare-fun m!810063 () Bool)

(assert (=> b!867887 m!810063))

(assert (=> b!867887 m!810041))

(assert (=> b!867887 m!810041))

(declare-fun m!810065 () Bool)

(assert (=> b!867887 m!810065))

(declare-fun m!810067 () Bool)

(assert (=> b!867893 m!810067))

(check-sat (not b_next!14749) (not b!867885) (not b!867887) (not start!74002) (not mapNonEmpty!26927) (not b!867878) (not b_lambda!12115) tp_is_empty!16885 b_and!24489 (not b!867888) (not b!867891) (not b!867880) (not b!867883) (not b!867890) (not b!867881))
(check-sat b_and!24489 (not b_next!14749))
