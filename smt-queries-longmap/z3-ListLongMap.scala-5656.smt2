; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73888 () Bool)

(assert start!73888)

(declare-fun b_free!14635 () Bool)

(declare-fun b_next!14635 () Bool)

(assert (=> start!73888 (= b_free!14635 (not b_next!14635))))

(declare-fun tp!51410 () Bool)

(declare-fun b_and!24259 () Bool)

(assert (=> start!73888 (= tp!51410 b_and!24259)))

(declare-fun b!865028 () Bool)

(declare-fun res!587529 () Bool)

(declare-fun e!481984 () Bool)

(assert (=> b!865028 (=> (not res!587529) (not e!481984))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49753 0))(
  ( (array!49754 (arr!23903 (Array (_ BitVec 32) (_ BitVec 64))) (size!24344 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49753)

(assert (=> b!865028 (= res!587529 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24344 _keys!868))))))

(declare-fun b!865029 () Bool)

(declare-datatypes ((Unit!29541 0))(
  ( (Unit!29542) )
))
(declare-fun e!481981 () Unit!29541)

(declare-fun Unit!29543 () Unit!29541)

(assert (=> b!865029 (= e!481981 Unit!29543)))

(declare-fun b!865030 () Bool)

(declare-fun e!481987 () Bool)

(declare-fun tp_is_empty!16771 () Bool)

(assert (=> b!865030 (= e!481987 tp_is_empty!16771)))

(declare-fun b!865031 () Bool)

(declare-fun res!587527 () Bool)

(assert (=> b!865031 (=> (not res!587527) (not e!481984))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865031 (= res!587527 (validKeyInArray!0 k0!854))))

(declare-fun b!865032 () Bool)

(declare-fun e!481985 () Bool)

(declare-fun e!481980 () Bool)

(assert (=> b!865032 (= e!481985 e!481980)))

(declare-fun res!587526 () Bool)

(assert (=> b!865032 (=> res!587526 e!481980)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!865032 (= res!587526 (= k0!854 (select (arr!23903 _keys!868) from!1053)))))

(assert (=> b!865032 (not (= (select (arr!23903 _keys!868) from!1053) k0!854))))

(declare-fun lt!391252 () Unit!29541)

(assert (=> b!865032 (= lt!391252 e!481981)))

(declare-fun c!92455 () Bool)

(assert (=> b!865032 (= c!92455 (= (select (arr!23903 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27409 0))(
  ( (V!27410 (val!8433 Int)) )
))
(declare-datatypes ((tuple2!11084 0))(
  ( (tuple2!11085 (_1!5553 (_ BitVec 64)) (_2!5553 V!27409)) )
))
(declare-datatypes ((List!16917 0))(
  ( (Nil!16914) (Cons!16913 (h!18050 tuple2!11084) (t!23810 List!16917)) )
))
(declare-datatypes ((ListLongMap!9855 0))(
  ( (ListLongMap!9856 (toList!4943 List!16917)) )
))
(declare-fun lt!391255 () ListLongMap!9855)

(declare-fun lt!391257 () ListLongMap!9855)

(assert (=> b!865032 (= lt!391255 lt!391257)))

(declare-fun lt!391264 () ListLongMap!9855)

(declare-fun lt!391254 () tuple2!11084)

(declare-fun +!2346 (ListLongMap!9855 tuple2!11084) ListLongMap!9855)

(assert (=> b!865032 (= lt!391257 (+!2346 lt!391264 lt!391254))))

(declare-fun lt!391253 () V!27409)

(assert (=> b!865032 (= lt!391254 (tuple2!11085 (select (arr!23903 _keys!868) from!1053) lt!391253))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7946 0))(
  ( (ValueCellFull!7946 (v!10858 V!27409)) (EmptyCell!7946) )
))
(declare-datatypes ((array!49755 0))(
  ( (array!49756 (arr!23904 (Array (_ BitVec 32) ValueCell!7946)) (size!24345 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49755)

(declare-fun get!12633 (ValueCell!7946 V!27409) V!27409)

(declare-fun dynLambda!1171 (Int (_ BitVec 64)) V!27409)

(assert (=> b!865032 (= lt!391253 (get!12633 (select (arr!23904 _values!688) from!1053) (dynLambda!1171 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865033 () Bool)

(declare-fun res!587523 () Bool)

(assert (=> b!865033 (=> (not res!587523) (not e!481984))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865033 (= res!587523 (validMask!0 mask!1196))))

(declare-fun res!587530 () Bool)

(assert (=> start!73888 (=> (not res!587530) (not e!481984))))

(assert (=> start!73888 (= res!587530 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24344 _keys!868))))))

(assert (=> start!73888 e!481984))

(assert (=> start!73888 tp_is_empty!16771))

(assert (=> start!73888 true))

(assert (=> start!73888 tp!51410))

(declare-fun array_inv!18958 (array!49753) Bool)

(assert (=> start!73888 (array_inv!18958 _keys!868)))

(declare-fun e!481982 () Bool)

(declare-fun array_inv!18959 (array!49755) Bool)

(assert (=> start!73888 (and (array_inv!18959 _values!688) e!481982)))

(declare-fun b!865034 () Bool)

(declare-fun e!481986 () Bool)

(assert (=> b!865034 (= e!481986 tp_is_empty!16771)))

(declare-fun b!865035 () Bool)

(declare-fun res!587524 () Bool)

(assert (=> b!865035 (=> (not res!587524) (not e!481984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49753 (_ BitVec 32)) Bool)

(assert (=> b!865035 (= res!587524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26756 () Bool)

(declare-fun mapRes!26756 () Bool)

(assert (=> mapIsEmpty!26756 mapRes!26756))

(declare-fun b!865036 () Bool)

(assert (=> b!865036 (= e!481982 (and e!481987 mapRes!26756))))

(declare-fun condMapEmpty!26756 () Bool)

(declare-fun mapDefault!26756 () ValueCell!7946)

(assert (=> b!865036 (= condMapEmpty!26756 (= (arr!23904 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7946)) mapDefault!26756)))))

(declare-fun b!865037 () Bool)

(declare-fun e!481979 () Bool)

(assert (=> b!865037 (= e!481984 e!481979)))

(declare-fun res!587525 () Bool)

(assert (=> b!865037 (=> (not res!587525) (not e!481979))))

(assert (=> b!865037 (= res!587525 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!391261 () array!49755)

(declare-fun minValue!654 () V!27409)

(declare-fun zeroValue!654 () V!27409)

(declare-fun getCurrentListMapNoExtraKeys!2993 (array!49753 array!49755 (_ BitVec 32) (_ BitVec 32) V!27409 V!27409 (_ BitVec 32) Int) ListLongMap!9855)

(assert (=> b!865037 (= lt!391255 (getCurrentListMapNoExtraKeys!2993 _keys!868 lt!391261 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27409)

(assert (=> b!865037 (= lt!391261 (array!49756 (store (arr!23904 _values!688) i!612 (ValueCellFull!7946 v!557)) (size!24345 _values!688)))))

(declare-fun lt!391258 () ListLongMap!9855)

(assert (=> b!865037 (= lt!391258 (getCurrentListMapNoExtraKeys!2993 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865038 () Bool)

(declare-fun res!587528 () Bool)

(assert (=> b!865038 (=> (not res!587528) (not e!481984))))

(assert (=> b!865038 (= res!587528 (and (= (size!24345 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24344 _keys!868) (size!24345 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865039 () Bool)

(assert (=> b!865039 (= e!481980 true)))

(declare-fun lt!391265 () ListLongMap!9855)

(declare-fun lt!391263 () tuple2!11084)

(assert (=> b!865039 (= lt!391257 (+!2346 (+!2346 lt!391265 lt!391254) lt!391263))))

(declare-fun lt!391256 () Unit!29541)

(declare-fun addCommutativeForDiffKeys!497 (ListLongMap!9855 (_ BitVec 64) V!27409 (_ BitVec 64) V!27409) Unit!29541)

(assert (=> b!865039 (= lt!391256 (addCommutativeForDiffKeys!497 lt!391265 k0!854 v!557 (select (arr!23903 _keys!868) from!1053) lt!391253))))

(declare-fun b!865040 () Bool)

(declare-fun res!587522 () Bool)

(assert (=> b!865040 (=> (not res!587522) (not e!481984))))

(assert (=> b!865040 (= res!587522 (and (= (select (arr!23903 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865041 () Bool)

(declare-fun Unit!29544 () Unit!29541)

(assert (=> b!865041 (= e!481981 Unit!29544)))

(declare-fun lt!391251 () Unit!29541)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49753 (_ BitVec 32) (_ BitVec 32)) Unit!29541)

(assert (=> b!865041 (= lt!391251 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16918 0))(
  ( (Nil!16915) (Cons!16914 (h!18051 (_ BitVec 64)) (t!23811 List!16918)) )
))
(declare-fun arrayNoDuplicates!0 (array!49753 (_ BitVec 32) List!16918) Bool)

(assert (=> b!865041 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16915)))

(declare-fun lt!391262 () Unit!29541)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49753 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29541)

(assert (=> b!865041 (= lt!391262 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865041 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391250 () Unit!29541)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49753 (_ BitVec 64) (_ BitVec 32) List!16918) Unit!29541)

(assert (=> b!865041 (= lt!391250 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16915))))

(assert (=> b!865041 false))

(declare-fun mapNonEmpty!26756 () Bool)

(declare-fun tp!51409 () Bool)

(assert (=> mapNonEmpty!26756 (= mapRes!26756 (and tp!51409 e!481986))))

(declare-fun mapValue!26756 () ValueCell!7946)

(declare-fun mapKey!26756 () (_ BitVec 32))

(declare-fun mapRest!26756 () (Array (_ BitVec 32) ValueCell!7946))

(assert (=> mapNonEmpty!26756 (= (arr!23904 _values!688) (store mapRest!26756 mapKey!26756 mapValue!26756))))

(declare-fun b!865042 () Bool)

(assert (=> b!865042 (= e!481979 (not e!481985))))

(declare-fun res!587520 () Bool)

(assert (=> b!865042 (=> res!587520 e!481985)))

(assert (=> b!865042 (= res!587520 (not (validKeyInArray!0 (select (arr!23903 _keys!868) from!1053))))))

(declare-fun lt!391259 () ListLongMap!9855)

(assert (=> b!865042 (= lt!391259 lt!391264)))

(assert (=> b!865042 (= lt!391264 (+!2346 lt!391265 lt!391263))))

(assert (=> b!865042 (= lt!391259 (getCurrentListMapNoExtraKeys!2993 _keys!868 lt!391261 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865042 (= lt!391263 (tuple2!11085 k0!854 v!557))))

(assert (=> b!865042 (= lt!391265 (getCurrentListMapNoExtraKeys!2993 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391260 () Unit!29541)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!530 (array!49753 array!49755 (_ BitVec 32) (_ BitVec 32) V!27409 V!27409 (_ BitVec 32) (_ BitVec 64) V!27409 (_ BitVec 32) Int) Unit!29541)

(assert (=> b!865042 (= lt!391260 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!530 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865043 () Bool)

(declare-fun res!587521 () Bool)

(assert (=> b!865043 (=> (not res!587521) (not e!481984))))

(assert (=> b!865043 (= res!587521 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16915))))

(assert (= (and start!73888 res!587530) b!865033))

(assert (= (and b!865033 res!587523) b!865038))

(assert (= (and b!865038 res!587528) b!865035))

(assert (= (and b!865035 res!587524) b!865043))

(assert (= (and b!865043 res!587521) b!865028))

(assert (= (and b!865028 res!587529) b!865031))

(assert (= (and b!865031 res!587527) b!865040))

(assert (= (and b!865040 res!587522) b!865037))

(assert (= (and b!865037 res!587525) b!865042))

(assert (= (and b!865042 (not res!587520)) b!865032))

(assert (= (and b!865032 c!92455) b!865041))

(assert (= (and b!865032 (not c!92455)) b!865029))

(assert (= (and b!865032 (not res!587526)) b!865039))

(assert (= (and b!865036 condMapEmpty!26756) mapIsEmpty!26756))

(assert (= (and b!865036 (not condMapEmpty!26756)) mapNonEmpty!26756))

(get-info :version)

(assert (= (and mapNonEmpty!26756 ((_ is ValueCellFull!7946) mapValue!26756)) b!865034))

(assert (= (and b!865036 ((_ is ValueCellFull!7946) mapDefault!26756)) b!865030))

(assert (= start!73888 b!865036))

(declare-fun b_lambda!12001 () Bool)

(assert (=> (not b_lambda!12001) (not b!865032)))

(declare-fun t!23809 () Bool)

(declare-fun tb!4749 () Bool)

(assert (=> (and start!73888 (= defaultEntry!696 defaultEntry!696) t!23809) tb!4749))

(declare-fun result!9117 () Bool)

(assert (=> tb!4749 (= result!9117 tp_is_empty!16771)))

(assert (=> b!865032 t!23809))

(declare-fun b_and!24261 () Bool)

(assert (= b_and!24259 (and (=> t!23809 result!9117) b_and!24261)))

(declare-fun m!806705 () Bool)

(assert (=> b!865039 m!806705))

(assert (=> b!865039 m!806705))

(declare-fun m!806707 () Bool)

(assert (=> b!865039 m!806707))

(declare-fun m!806709 () Bool)

(assert (=> b!865039 m!806709))

(assert (=> b!865039 m!806709))

(declare-fun m!806711 () Bool)

(assert (=> b!865039 m!806711))

(declare-fun m!806713 () Bool)

(assert (=> b!865040 m!806713))

(declare-fun m!806715 () Bool)

(assert (=> start!73888 m!806715))

(declare-fun m!806717 () Bool)

(assert (=> start!73888 m!806717))

(declare-fun m!806719 () Bool)

(assert (=> b!865041 m!806719))

(declare-fun m!806721 () Bool)

(assert (=> b!865041 m!806721))

(declare-fun m!806723 () Bool)

(assert (=> b!865041 m!806723))

(declare-fun m!806725 () Bool)

(assert (=> b!865041 m!806725))

(declare-fun m!806727 () Bool)

(assert (=> b!865041 m!806727))

(declare-fun m!806729 () Bool)

(assert (=> mapNonEmpty!26756 m!806729))

(declare-fun m!806731 () Bool)

(assert (=> b!865033 m!806731))

(declare-fun m!806733 () Bool)

(assert (=> b!865035 m!806733))

(declare-fun m!806735 () Bool)

(assert (=> b!865032 m!806735))

(declare-fun m!806737 () Bool)

(assert (=> b!865032 m!806737))

(declare-fun m!806739 () Bool)

(assert (=> b!865032 m!806739))

(declare-fun m!806741 () Bool)

(assert (=> b!865032 m!806741))

(assert (=> b!865032 m!806737))

(assert (=> b!865032 m!806709))

(assert (=> b!865032 m!806739))

(declare-fun m!806743 () Bool)

(assert (=> b!865043 m!806743))

(declare-fun m!806745 () Bool)

(assert (=> b!865031 m!806745))

(declare-fun m!806747 () Bool)

(assert (=> b!865037 m!806747))

(declare-fun m!806749 () Bool)

(assert (=> b!865037 m!806749))

(declare-fun m!806751 () Bool)

(assert (=> b!865037 m!806751))

(declare-fun m!806753 () Bool)

(assert (=> b!865042 m!806753))

(declare-fun m!806755 () Bool)

(assert (=> b!865042 m!806755))

(declare-fun m!806757 () Bool)

(assert (=> b!865042 m!806757))

(assert (=> b!865042 m!806709))

(declare-fun m!806759 () Bool)

(assert (=> b!865042 m!806759))

(assert (=> b!865042 m!806709))

(declare-fun m!806761 () Bool)

(assert (=> b!865042 m!806761))

(check-sat (not b!865031) (not start!73888) (not b!865037) tp_is_empty!16771 (not b!865043) (not b!865039) (not b_lambda!12001) (not b!865032) (not b!865041) b_and!24261 (not b!865042) (not b!865035) (not b!865033) (not mapNonEmpty!26756) (not b_next!14635))
(check-sat b_and!24261 (not b_next!14635))
