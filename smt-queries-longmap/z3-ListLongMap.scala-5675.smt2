; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73816 () Bool)

(assert start!73816)

(declare-fun b_free!14749 () Bool)

(declare-fun b_next!14749 () Bool)

(assert (=> start!73816 (= b_free!14749 (not b_next!14749))))

(declare-fun tp!51752 () Bool)

(declare-fun b_and!24451 () Bool)

(assert (=> start!73816 (= tp!51752 b_and!24451)))

(declare-fun b!866736 () Bool)

(declare-fun e!482793 () Bool)

(declare-fun e!482792 () Bool)

(declare-fun mapRes!26927 () Bool)

(assert (=> b!866736 (= e!482793 (and e!482792 mapRes!26927))))

(declare-fun condMapEmpty!26927 () Bool)

(declare-datatypes ((V!27561 0))(
  ( (V!27562 (val!8490 Int)) )
))
(declare-datatypes ((ValueCell!8003 0))(
  ( (ValueCellFull!8003 (v!10909 V!27561)) (EmptyCell!8003) )
))
(declare-datatypes ((array!49919 0))(
  ( (array!49920 (arr!23991 (Array (_ BitVec 32) ValueCell!8003)) (size!24433 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49919)

(declare-fun mapDefault!26927 () ValueCell!8003)

(assert (=> b!866736 (= condMapEmpty!26927 (= (arr!23991 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8003)) mapDefault!26927)))))

(declare-fun b!866737 () Bool)

(declare-fun res!588950 () Bool)

(declare-fun e!482789 () Bool)

(assert (=> b!866737 (=> (not res!588950) (not e!482789))))

(declare-datatypes ((array!49921 0))(
  ( (array!49922 (arr!23992 (Array (_ BitVec 32) (_ BitVec 64))) (size!24434 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49921)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49921 (_ BitVec 32)) Bool)

(assert (=> b!866737 (= res!588950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866738 () Bool)

(declare-fun res!588957 () Bool)

(assert (=> b!866738 (=> (not res!588957) (not e!482789))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!866738 (= res!588957 (and (= (size!24433 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24434 _keys!868) (size!24433 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866739 () Bool)

(declare-fun res!588955 () Bool)

(assert (=> b!866739 (=> (not res!588955) (not e!482789))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866739 (= res!588955 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24434 _keys!868))))))

(declare-fun b!866740 () Bool)

(declare-fun e!482790 () Bool)

(assert (=> b!866740 (= e!482789 e!482790)))

(declare-fun res!588956 () Bool)

(assert (=> b!866740 (=> (not res!588956) (not e!482790))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866740 (= res!588956 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11284 0))(
  ( (tuple2!11285 (_1!5653 (_ BitVec 64)) (_2!5653 V!27561)) )
))
(declare-datatypes ((List!17071 0))(
  ( (Nil!17068) (Cons!17067 (h!18198 tuple2!11284) (t!24077 List!17071)) )
))
(declare-datatypes ((ListLongMap!10043 0))(
  ( (ListLongMap!10044 (toList!5037 List!17071)) )
))
(declare-fun lt!393400 () ListLongMap!10043)

(declare-fun minValue!654 () V!27561)

(declare-fun lt!393392 () array!49919)

(declare-fun zeroValue!654 () V!27561)

(declare-fun getCurrentListMapNoExtraKeys!3031 (array!49921 array!49919 (_ BitVec 32) (_ BitVec 32) V!27561 V!27561 (_ BitVec 32) Int) ListLongMap!10043)

(assert (=> b!866740 (= lt!393400 (getCurrentListMapNoExtraKeys!3031 _keys!868 lt!393392 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27561)

(assert (=> b!866740 (= lt!393392 (array!49920 (store (arr!23991 _values!688) i!612 (ValueCellFull!8003 v!557)) (size!24433 _values!688)))))

(declare-fun lt!393390 () ListLongMap!10043)

(assert (=> b!866740 (= lt!393390 (getCurrentListMapNoExtraKeys!3031 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26927 () Bool)

(declare-fun tp!51751 () Bool)

(declare-fun e!482795 () Bool)

(assert (=> mapNonEmpty!26927 (= mapRes!26927 (and tp!51751 e!482795))))

(declare-fun mapRest!26927 () (Array (_ BitVec 32) ValueCell!8003))

(declare-fun mapKey!26927 () (_ BitVec 32))

(declare-fun mapValue!26927 () ValueCell!8003)

(assert (=> mapNonEmpty!26927 (= (arr!23991 _values!688) (store mapRest!26927 mapKey!26927 mapValue!26927))))

(declare-fun mapIsEmpty!26927 () Bool)

(assert (=> mapIsEmpty!26927 mapRes!26927))

(declare-fun b!866741 () Bool)

(declare-fun e!482794 () Bool)

(assert (=> b!866741 (= e!482794 true)))

(declare-fun lt!393401 () tuple2!11284)

(declare-fun lt!393402 () tuple2!11284)

(declare-fun lt!393395 () ListLongMap!10043)

(declare-fun lt!393391 () ListLongMap!10043)

(declare-fun +!2403 (ListLongMap!10043 tuple2!11284) ListLongMap!10043)

(assert (=> b!866741 (= lt!393395 (+!2403 (+!2403 lt!393391 lt!393402) lt!393401))))

(declare-datatypes ((Unit!29670 0))(
  ( (Unit!29671) )
))
(declare-fun lt!393393 () Unit!29670)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!393396 () V!27561)

(declare-fun addCommutativeForDiffKeys!540 (ListLongMap!10043 (_ BitVec 64) V!27561 (_ BitVec 64) V!27561) Unit!29670)

(assert (=> b!866741 (= lt!393393 (addCommutativeForDiffKeys!540 lt!393391 k0!854 v!557 (select (arr!23992 _keys!868) from!1053) lt!393396))))

(declare-fun b!866742 () Bool)

(declare-fun e!482788 () Bool)

(assert (=> b!866742 (= e!482788 e!482794)))

(declare-fun res!588954 () Bool)

(assert (=> b!866742 (=> res!588954 e!482794)))

(assert (=> b!866742 (= res!588954 (= k0!854 (select (arr!23992 _keys!868) from!1053)))))

(assert (=> b!866742 (not (= (select (arr!23992 _keys!868) from!1053) k0!854))))

(declare-fun lt!393404 () Unit!29670)

(declare-fun e!482791 () Unit!29670)

(assert (=> b!866742 (= lt!393404 e!482791)))

(declare-fun c!92279 () Bool)

(assert (=> b!866742 (= c!92279 (= (select (arr!23992 _keys!868) from!1053) k0!854))))

(assert (=> b!866742 (= lt!393400 lt!393395)))

(declare-fun lt!393394 () ListLongMap!10043)

(assert (=> b!866742 (= lt!393395 (+!2403 lt!393394 lt!393402))))

(assert (=> b!866742 (= lt!393402 (tuple2!11285 (select (arr!23992 _keys!868) from!1053) lt!393396))))

(declare-fun get!12691 (ValueCell!8003 V!27561) V!27561)

(declare-fun dynLambda!1194 (Int (_ BitVec 64)) V!27561)

(assert (=> b!866742 (= lt!393396 (get!12691 (select (arr!23991 _values!688) from!1053) (dynLambda!1194 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!588949 () Bool)

(assert (=> start!73816 (=> (not res!588949) (not e!482789))))

(assert (=> start!73816 (= res!588949 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24434 _keys!868))))))

(assert (=> start!73816 e!482789))

(declare-fun tp_is_empty!16885 () Bool)

(assert (=> start!73816 tp_is_empty!16885))

(assert (=> start!73816 true))

(assert (=> start!73816 tp!51752))

(declare-fun array_inv!19036 (array!49921) Bool)

(assert (=> start!73816 (array_inv!19036 _keys!868)))

(declare-fun array_inv!19037 (array!49919) Bool)

(assert (=> start!73816 (and (array_inv!19037 _values!688) e!482793)))

(declare-fun b!866743 () Bool)

(declare-fun Unit!29672 () Unit!29670)

(assert (=> b!866743 (= e!482791 Unit!29672)))

(declare-fun b!866744 () Bool)

(declare-fun res!588947 () Bool)

(assert (=> b!866744 (=> (not res!588947) (not e!482789))))

(declare-datatypes ((List!17072 0))(
  ( (Nil!17069) (Cons!17068 (h!18199 (_ BitVec 64)) (t!24078 List!17072)) )
))
(declare-fun arrayNoDuplicates!0 (array!49921 (_ BitVec 32) List!17072) Bool)

(assert (=> b!866744 (= res!588947 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17069))))

(declare-fun b!866745 () Bool)

(declare-fun res!588953 () Bool)

(assert (=> b!866745 (=> (not res!588953) (not e!482789))))

(assert (=> b!866745 (= res!588953 (and (= (select (arr!23992 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866746 () Bool)

(assert (=> b!866746 (= e!482790 (not e!482788))))

(declare-fun res!588948 () Bool)

(assert (=> b!866746 (=> res!588948 e!482788)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866746 (= res!588948 (not (validKeyInArray!0 (select (arr!23992 _keys!868) from!1053))))))

(declare-fun lt!393389 () ListLongMap!10043)

(assert (=> b!866746 (= lt!393389 lt!393394)))

(assert (=> b!866746 (= lt!393394 (+!2403 lt!393391 lt!393401))))

(assert (=> b!866746 (= lt!393389 (getCurrentListMapNoExtraKeys!3031 _keys!868 lt!393392 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866746 (= lt!393401 (tuple2!11285 k0!854 v!557))))

(assert (=> b!866746 (= lt!393391 (getCurrentListMapNoExtraKeys!3031 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393398 () Unit!29670)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!572 (array!49921 array!49919 (_ BitVec 32) (_ BitVec 32) V!27561 V!27561 (_ BitVec 32) (_ BitVec 64) V!27561 (_ BitVec 32) Int) Unit!29670)

(assert (=> b!866746 (= lt!393398 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!572 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866747 () Bool)

(declare-fun Unit!29673 () Unit!29670)

(assert (=> b!866747 (= e!482791 Unit!29673)))

(declare-fun lt!393403 () Unit!29670)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49921 (_ BitVec 32) (_ BitVec 32)) Unit!29670)

(assert (=> b!866747 (= lt!393403 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866747 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17069)))

(declare-fun lt!393397 () Unit!29670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49921 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29670)

(assert (=> b!866747 (= lt!393397 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866747 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393399 () Unit!29670)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49921 (_ BitVec 64) (_ BitVec 32) List!17072) Unit!29670)

(assert (=> b!866747 (= lt!393399 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17069))))

(assert (=> b!866747 false))

(declare-fun b!866748 () Bool)

(declare-fun res!588952 () Bool)

(assert (=> b!866748 (=> (not res!588952) (not e!482789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866748 (= res!588952 (validMask!0 mask!1196))))

(declare-fun b!866749 () Bool)

(assert (=> b!866749 (= e!482795 tp_is_empty!16885)))

(declare-fun b!866750 () Bool)

(declare-fun res!588951 () Bool)

(assert (=> b!866750 (=> (not res!588951) (not e!482789))))

(assert (=> b!866750 (= res!588951 (validKeyInArray!0 k0!854))))

(declare-fun b!866751 () Bool)

(assert (=> b!866751 (= e!482792 tp_is_empty!16885)))

(assert (= (and start!73816 res!588949) b!866748))

(assert (= (and b!866748 res!588952) b!866738))

(assert (= (and b!866738 res!588957) b!866737))

(assert (= (and b!866737 res!588950) b!866744))

(assert (= (and b!866744 res!588947) b!866739))

(assert (= (and b!866739 res!588955) b!866750))

(assert (= (and b!866750 res!588951) b!866745))

(assert (= (and b!866745 res!588953) b!866740))

(assert (= (and b!866740 res!588956) b!866746))

(assert (= (and b!866746 (not res!588948)) b!866742))

(assert (= (and b!866742 c!92279) b!866747))

(assert (= (and b!866742 (not c!92279)) b!866743))

(assert (= (and b!866742 (not res!588954)) b!866741))

(assert (= (and b!866736 condMapEmpty!26927) mapIsEmpty!26927))

(assert (= (and b!866736 (not condMapEmpty!26927)) mapNonEmpty!26927))

(get-info :version)

(assert (= (and mapNonEmpty!26927 ((_ is ValueCellFull!8003) mapValue!26927)) b!866749))

(assert (= (and b!866736 ((_ is ValueCellFull!8003) mapDefault!26927)) b!866751))

(assert (= start!73816 b!866736))

(declare-fun b_lambda!12083 () Bool)

(assert (=> (not b_lambda!12083) (not b!866742)))

(declare-fun t!24076 () Bool)

(declare-fun tb!4863 () Bool)

(assert (=> (and start!73816 (= defaultEntry!696 defaultEntry!696) t!24076) tb!4863))

(declare-fun result!9345 () Bool)

(assert (=> tb!4863 (= result!9345 tp_is_empty!16885)))

(assert (=> b!866742 t!24076))

(declare-fun b_and!24453 () Bool)

(assert (= b_and!24451 (and (=> t!24076 result!9345) b_and!24453)))

(declare-fun m!807963 () Bool)

(assert (=> b!866745 m!807963))

(declare-fun m!807965 () Bool)

(assert (=> b!866746 m!807965))

(declare-fun m!807967 () Bool)

(assert (=> b!866746 m!807967))

(declare-fun m!807969 () Bool)

(assert (=> b!866746 m!807969))

(declare-fun m!807971 () Bool)

(assert (=> b!866746 m!807971))

(assert (=> b!866746 m!807969))

(declare-fun m!807973 () Bool)

(assert (=> b!866746 m!807973))

(declare-fun m!807975 () Bool)

(assert (=> b!866746 m!807975))

(declare-fun m!807977 () Bool)

(assert (=> b!866747 m!807977))

(declare-fun m!807979 () Bool)

(assert (=> b!866747 m!807979))

(declare-fun m!807981 () Bool)

(assert (=> b!866747 m!807981))

(declare-fun m!807983 () Bool)

(assert (=> b!866747 m!807983))

(declare-fun m!807985 () Bool)

(assert (=> b!866747 m!807985))

(declare-fun m!807987 () Bool)

(assert (=> b!866748 m!807987))

(declare-fun m!807989 () Bool)

(assert (=> b!866741 m!807989))

(assert (=> b!866741 m!807989))

(declare-fun m!807991 () Bool)

(assert (=> b!866741 m!807991))

(assert (=> b!866741 m!807969))

(assert (=> b!866741 m!807969))

(declare-fun m!807993 () Bool)

(assert (=> b!866741 m!807993))

(declare-fun m!807995 () Bool)

(assert (=> mapNonEmpty!26927 m!807995))

(declare-fun m!807997 () Bool)

(assert (=> b!866737 m!807997))

(declare-fun m!807999 () Bool)

(assert (=> b!866744 m!807999))

(declare-fun m!808001 () Bool)

(assert (=> b!866750 m!808001))

(declare-fun m!808003 () Bool)

(assert (=> b!866742 m!808003))

(declare-fun m!808005 () Bool)

(assert (=> b!866742 m!808005))

(declare-fun m!808007 () Bool)

(assert (=> b!866742 m!808007))

(declare-fun m!808009 () Bool)

(assert (=> b!866742 m!808009))

(assert (=> b!866742 m!808005))

(assert (=> b!866742 m!807969))

(assert (=> b!866742 m!808007))

(declare-fun m!808011 () Bool)

(assert (=> b!866740 m!808011))

(declare-fun m!808013 () Bool)

(assert (=> b!866740 m!808013))

(declare-fun m!808015 () Bool)

(assert (=> b!866740 m!808015))

(declare-fun m!808017 () Bool)

(assert (=> start!73816 m!808017))

(declare-fun m!808019 () Bool)

(assert (=> start!73816 m!808019))

(check-sat b_and!24453 (not b_next!14749) (not b_lambda!12083) (not b!866744) (not mapNonEmpty!26927) (not b!866740) (not b!866746) tp_is_empty!16885 (not b!866747) (not b!866737) (not b!866742) (not b!866750) (not b!866748) (not start!73816) (not b!866741))
(check-sat b_and!24453 (not b_next!14749))
